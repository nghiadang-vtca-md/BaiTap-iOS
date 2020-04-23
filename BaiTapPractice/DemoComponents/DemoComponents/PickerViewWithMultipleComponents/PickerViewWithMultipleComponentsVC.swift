//
//  PickerViewWithMultipleComponentsVC.swift
//  DemoComponents
//
//  Created by nghiadang1205 on 3/21/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit

class Country {
    var country: String
    var cities: [String]
    
    init(country: String, cities: [String]) {
        self.country = country
        self.cities = cities
    }
}

class PickerViewWithMultipleComponentsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var parentLabel: UILabel!
    @IBOutlet weak var childLabel: UILabel!
    
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        countries.append(Country(country: "VietNam", cities: ["TP.HCM", "Ha Noi", "Da Nang"]))
        countries.append(Country(country: "USA", cities: ["New York", "DC", "Fairfax"]))
        countries.append(Country(country: "Austrailia", cities: ["Sysney", "Melbourne", "Brisbane"]))

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return countries.count
        } else {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return countries[row].country
        } else {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        
        let selectedCountry = pickerView.selectedRow(inComponent: 0)
        let selectedCity = pickerView.selectedRow(inComponent: 1)
        let country = countries[selectedCountry].country
        let city = countries[selectedCountry].cities[selectedCity]
        
        parentLabel.text = "Country: \(country)"
        childLabel.text = "City: \(city)"
        
    }
    

}


