//
//  StretchyHeader.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/28/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class StretchyHeader: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Food] = []
    
    // MARK: Setup stretchy header
    var Headerview: UIView!
    var NewHeaderLayer: CAShapeLayer!
    
    private let Headerheight: CGFloat = 420
    private let Headercut: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.updateView()
    }
    
    func updateView() {
        tableView.backgroundColor = .white
        Headerview = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = UITableView.automaticDimension
        tableView.addSubview(Headerview)
        
        NewHeaderLayer = CAShapeLayer()
        NewHeaderLayer.fillColor = UIColor.black.cgColor
        Headerview.layer.mask = NewHeaderLayer
        
        let newHeight = Headerheight - Headercut / 2
        tableView.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -newHeight)
        
        self.setupNewView()
    }
    
    func setupNewView() {
        let newheight = Headerheight - Headercut / 2
        var getheaderframe = CGRect(x: 0, y: -newheight, width: tableView.bounds.width, height: Headerheight)
        if tableView.contentOffset.y < newheight {
            getheaderframe.origin.y = tableView.contentOffset.y
            getheaderframe.size.height = -tableView.contentOffset.y + Headercut / 2
        }
        
        Headerview.frame = getheaderframe
        let cutdirection = UIBezierPath()
        cutdirection.move(to: CGPoint(x: 0, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: getheaderframe.height))
        cutdirection.addLine(to: CGPoint(x: 0, y: getheaderframe.height - Headercut))
        NewHeaderLayer.path = cutdirection.cgPath
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.setupNewView()
        
        var offset = scrollView.contentOffset.y / 150
        //let color2 = UIColor.yellow
        if offset > -0.5 {
            offset = 1
            UIView.animate(withDuration: 0.2) {
                let color = UIColor.init(red: 1, green: 1, blue: 1, alpha: offset)
                let navigationColor = UIColor.init(hue: 0, saturation: offset, brightness: 1, alpha: 1)
                
                self.navigationController?.navigationBar.tintColor = navigationColor
                self.navigationController?.navigationBar.backgroundColor = color
                UIApplication.shared.statusBarUIView?.backgroundColor = color
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: navigationColor]
                self.navigationController?.navigationBar.barStyle = .default
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                let color = UIColor.init(red: 1, green: 1, blue: 1, alpha: offset)
                
                self.navigationController?.navigationBar.tintColor = .white
                self.navigationController?.navigationBar.backgroundColor = color
                UIApplication.shared.statusBarUIView?.backgroundColor = color
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                self.navigationController?.navigationBar.barStyle = .black
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension StretchyHeader: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = data[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        
        return cell
    }
    
    
    
}

extension StretchyHeader: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}



