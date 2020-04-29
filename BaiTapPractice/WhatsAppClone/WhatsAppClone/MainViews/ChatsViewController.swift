//
//  ChatsViewController.swift
//  WhatsAppClone
//
//  Created by nghiadang1205 on 4/24/20.
//  Copyright © 2020 NghiaDang. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ChatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RecentChatTableViewCellDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recentChats: [NSDictionary] = []
    var filteredChats: [NSDictionary] = []
    
    var recentListener: ListenerRegistration!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadRecentChats()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        recentListener.remove()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        setTableViewHeader()
    }
    
    
    
    // MARK: IBActions
    @IBAction func createNewChatButtonPressed(_ sender: Any) {
        let usersVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersTableView") as! UsersTableViewController
        self.navigationController?.pushViewController(usersVC, animated: true)
    }
    
    // MARK: TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredChats.count
        } else {
            return recentChats.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecentChatTableViewCell
        
        var recent: NSDictionary!
        
        if searchController.isActive && searchController.searchBar.text != "" {
            recent = filteredChats[indexPath.row]
        } else {
            recent = recentChats[indexPath.row]
        }
        
        cell.generateCell(recentChat: recent, indexPath: indexPath)
        cell.delegate = self
        
        return cell
    }
    
    // MARK: TableView delegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var temRecent: NSDictionary!
        
        if searchController.isActive && searchController.searchBar.text != "" {
            temRecent = filteredChats[indexPath.row]
        } else {
            temRecent = recentChats[indexPath.row]
        }
        
        var muteTitle = "Unmute"
        var mute = false
        
        if (temRecent[kMEMBERSTOPUSH] as! [String]).contains(FUser.currentId()) {
            muteTitle = "Mute"
            mute = true
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, boolValue) in
            
            
            if self.searchController.isActive && self.searchController.searchBar.text != "" {
                self.filteredChats.remove(at: indexPath.row)
            } else {
                self.recentChats.remove(at: indexPath.row)
            }
            
            
            deleteRecentChat(recentChatDictionary: temRecent)
            
            self.tableView.reloadData()
            
        }
        
        let muteAction = UIContextualAction(style: .normal, title: muteTitle) { (action, view, boolValue) in
            print("Mute \(indexPath)")
        }
        
        muteAction.backgroundColor = UIColor.link
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, muteAction])
        
        return swipeActions
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        var recent: NSDictionary!
        
        if searchController.isActive && searchController.searchBar.text != "" {
            recent = filteredChats[indexPath.row]
        } else {
            recent = recentChats[indexPath.row]
        }
        
        restartRecentChat(recent: recent)
        
        let chatVC = ChatViewController()
        chatVC.hidesBottomBarWhenPushed = true
        chatVC.titleName = (recent[kWITHUSERFULLNAME] as? String)!
        chatVC.memberIds = (recent[kMEMBERS] as? [String])!
        chatVC.membersToPush = (recent[kMEMBERSTOPUSH] as? [String])!
        chatVC.chatRoomId = (recent[kCHATROOMID] as? String)!
        chatVC.isGroup = (recent[kTYPE] as! String) == kGROUP
        
        navigationController?.pushViewController(chatVC, animated: true)
    }
    
    // MARK: Load Recent Chats
    
    func loadRecentChats() {
        
        recentListener = reference(.Recent).whereField(kUSERID, isEqualTo: FUser.currentId()).addSnapshotListener({ (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            self.recentChats = []
            
            if !snapshot.isEmpty {
                
                let sorted = ((dictionaryFromSnapshots(snapshots: snapshot.documents)) as NSArray).sortedArray(using: [NSSortDescriptor(key: kDATE, ascending: false)]) as! [NSDictionary]
                
                for recent in sorted {
                    
                    if recent[kLASTMESSAGE] as! String != "" && recent[kCHATROOMID] != nil && recent[kRECENTID] != nil {
                        
                        self.recentChats.append(recent)
                        
                    }
                    
                }
                
                self.tableView.reloadData()
                
            }
        })
    }
    
    // MARK: RecentChatCell Delegate
    
    func didTapAvatarImage(indexPath: IndexPath) {
        
        var recentChat: NSDictionary!
        
        if searchController.isActive && searchController.searchBar.text != "" {
            recentChat = filteredChats[indexPath.row]
        } else {
            recentChat = recentChats[indexPath.row]
        }
        
        if recentChat[kTYPE] as! String == kPRIVATE {
            
            reference(.User).document(recentChat[kWITHUSERUSERID] as! String).getDocument { (snapshot, error) in
                
                guard let snapshot = snapshot else { return }
                
                if snapshot.exists {
                    
                    let userDictionary = snapshot.data()! as NSDictionary
                    
                    let tempUser = FUser(_dictionary: userDictionary)
                    
                    self.showUserProfile(user: tempUser)
                    
                }
                
            }
            
        }
        
    }
    
    func showUserProfile(user: FUser) {
        
        let profileVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profileView") as! ProfileViewTableViewController
        
        profileVC.user = user
        
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    // MARK: Search controller functions
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredChats = recentChats.filter({ (recentChat) -> Bool in
            return (recentChat[kWITHUSERFULLNAME] as! String).lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    // MARK: Custom tableViewHeader
    
    func setTableViewHeader() {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 45))
        
        let buttonView = UIView(frame: CGRect(x: 0, y: 5, width: tableView.frame.width, height: 35))
        
        let groupButton = UIButton(frame: CGRect(x: tableView.frame.width - 110, y: 10, width: 100, height: 20))
        
        groupButton.addTarget(self, action: #selector(self.groupButtonPressed), for: .touchUpInside)
        groupButton.setTitle("New group", for: .normal)
        let buttonColor = UIColor.link
        groupButton.setTitleColor(buttonColor, for: .normal)
        
        let lineView = UIView(frame: CGRect(x: 0, y: headerView.frame.height - 1, width: tableView.frame.width, height: 1))
        lineView.backgroundColor = UIColor.gray
        
        buttonView.addSubview(groupButton)
        headerView.addSubview(buttonView)
        headerView.addSubview(lineView)
        
        tableView.tableHeaderView = headerView
        
    }
    
    @objc func groupButtonPressed() {
        print("Hello")
    }
}
