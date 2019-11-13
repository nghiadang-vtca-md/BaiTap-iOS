//
//  ViewController23_TableViewController.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/13/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController23_TableViewController: UITableViewController {

    let array = [[1,2,3],
    [4,5,6,4],
    [7,8,9,4,4]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.tableFooterView = UIView()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return array.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array[section].count
    }

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let frame = tableView.bounds
//
//        let button = UIButton(frame: CGRect(x: 8, y: 28, width: frame.size.width, height: frame.size.height))  // create button
//        button.tag = section
//        button.setTitle("ABC", for: .normal)
//        // the button is image - set image
//        //button.setImage(UIImage(named: "remove_button"), for: .normal)  // assumes there is an image named "remove_button"
////        button.addTarget(self, action: #selector(TestController.remove(_:)), forControlEvents: .TouchUpInside)  // add selector called by clicking on the button
//
//        //let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
//        let headerView = UIView()
//        headerView.addSubview(button)   // add the button to the view
//
//        return headerView
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray

        let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        sectionLabel.font = UIFont(name: "Helvetica", size: 12)
        sectionLabel.textColor = UIColor.black
        sectionLabel.text = "NETWORK SETTINGS"
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)

        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
//    {
//        switch section
//        {
//            case 0:
//                return "Apple Devices"
//            case 1:
//                return "Samsung Devices"
//            default:
//                return "Other Devices"
//        }
//    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Nghia"
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = "\(array[indexPath.section][indexPath.row])"
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

