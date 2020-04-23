//
//  ProgrammaticCustomTVC.swift
//  DemoTableViewFull
//
//  Created by nghiadang1205 on 3/17/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class ProgrammaticCustomTVC: UIViewController {
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.dataSource = self
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.register(ProgrammaticCell.self, forCellReuseIdentifier: "cell")
        return v
    }()

    var data: [FruitsNVeggies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        data = FruitsNVeggies.FoodItems()
        self.view.addSubview(tableView)
        self.title = "Programmatic Cell Example"
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ProgrammaticCustomTVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProgrammaticCell
        let item = data[indexPath.section].foodItems[indexPath.row]
        cell.setData(food: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
    
}

class ProgrammaticCell: UITableViewCell {
    private var foodData: Food? {
        didSet {
            imageV.image = foodData?.image
            titleText.text = foodData?.title
            subtitleText.text = foodData?.subtitle
        }
    }
    
    private lazy var imageV: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    private lazy var titleText: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 1
        return v
    }()
    
    private lazy var subtitleText: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 0
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(imageV)
        contentView.addSubview(titleText)
        contentView.addSubview(subtitleText)
        
        NSLayoutConstraint.activate([
            imageV.widthAnchor.constraint(equalToConstant: 100),
            imageV.heightAnchor.constraint(equalToConstant: 100),
            imageV.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 8),
            imageV.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
            titleText.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 8),
            titleText.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8),
            titleText.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -8),
            subtitleText.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 8),
            subtitleText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 8),
            subtitleText.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -8),
            subtitleText.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -8.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(food: Food) {
        self.foodData = food
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageV.image = nil
        self.titleText.text = nil
        self.subtitleText.text = nil
    }
}
