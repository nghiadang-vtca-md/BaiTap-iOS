//
//  ViewController.swift
//  DemoCollectionView
//
//  Created by nghiadang1205 on 2/12/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var deleteBarButton: UIBarButtonItem!
    @IBOutlet weak var bottomNav: UINavigationBar!
    
    
    var data = ["🐶", "🐷", "🐲", "🐳", "🐶", "🐷", "🐲", "🐳","🐶", "🐷", "🐲", "🐳", "🐶", "🐷", "🐲", "🐳","🐶", "🐷", "🐲", "🐳", "🐶", "🐷", "🐲", "🐳","🐶", "🐷", "🐲", "🐳", "🐶", "🐷", "🐲", "🐳","🐶", "🐷", "🐲", "🐳", "🐶", "🐷", "🐲", "🐳"]
    
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        refreshControl.addTarget(self, action: #selector(appendNewItem), for: .valueChanged)
        collectionView.refreshControl = self.refreshControl
        
        navigationItem.leftBarButtonItem = editButtonItem
        addLongPressToCollectionView()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        collectionView.allowsMultipleSelection = editing ? true : false
        addBarButton.isEnabled = !editing
        bottomNav.isHidden = !editing
        collectionView.indexPathsForSelectedItems?.forEach({ (indexPath) in
            collectionView.deselectItem(at: indexPath, animated: false)
        })
        collectionView.indexPathsForVisibleItems.forEach { (indexPath) in
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            cell.isEditing = editing
        }
        //collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // cách 1: sử dụng biến sender
//        guard let selectedItem = sender as? String else {
//            return
//        }
        
        // cách 2: sử dụng indexPath - áp dụng được chọn nhiều
        guard let index = collectionView.indexPathsForSelectedItems?.first else {
            return
        }
        let selectedItem = data[index.item] // item hoặc row đều được
        collectionView.deselectItem(at: index, animated: false) // khắc phục lỗi tap 2 lần - không cần nữa vì đã có biến isSelected
        print(selectedItem)
        
        if segue.identifier == "goToDetail" {
            guard let detailViewController = segue.destination as? DetailViewController else {
                return
            }
            detailViewController.selectedData = selectedItem
        }
    }

    @IBAction func insertNewItem() {
        inserttMultipleItems()
    }
    
    func insertOneItem() {
        let text = "🦀"
        data.append(text)
        let indexPath = IndexPath(row: data.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    func inserttMultipleItems() {
        collectionView.performBatchUpdates({
            for _ in 0..<5 {
                let text = "🐓"
                data.append(text)
                let indexPath = IndexPath(row: data.count - 1, section: 0)
                collectionView.insertItems(at: [indexPath])
            }
        }) { (_) in
            self.collectionView.scrollToItem(at: IndexPath(row: self.data.count - 1, section: 0), at: .top, animated: true)
        }
    }
    
    @objc func appendNewItem() {
        let text = "🐡"
        data.insert(text, at: 0)
        //collectionView.reloadData() // cách 1
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.insertItems(at: [indexPath]) // cách 2
        collectionView.refreshControl?.endRefreshing()
    }
    
    @IBAction func deleteSelectedItems(_ sender: UIBarButtonItem) {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            let items = selectedItems.map {$0.item}.sorted().reversed()
            print(items)
            for item in items {
                data.remove(at: item)
            }
            collectionView.deleteItems(at: selectedItems)
        }
        
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cách 1: static cell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        if let label = cell.viewWithTag(100) as? UILabel {
//            label.text = data[indexPath.row]
//        }
        // cách 2: custom cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell else { fatalError() }
        cell.itemLabel.text = data[indexPath.row]
        cell.isEditing = isEditing
        
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    // cell selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !isEditing {
            let selectedData = data[indexPath.row]
            self.performSegue(withIdentifier: "goToDetail", sender: selectedData)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if !isEditing {
//            let selectedData = data[indexPath.row]
//            self.performSegue(withIdentifier: "goToDetail", sender: selectedData)
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = data.remove(at: sourceIndexPath.item)
        data.insert(item, at: destinationIndexPath.item)
    }
    
    func addLongPressToCollectionView() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(gesture:)))
        self.collectionView.addGestureRecognizer(longPress)
    }
    
    @objc func longPressGesture(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else { return }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItems = 3
        let screenWidth = view.frame.width - CGFloat((numberOfItems - 1) * 10)
        let width = screenWidth / CGFloat(numberOfItems)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

