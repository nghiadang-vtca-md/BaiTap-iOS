//
//  ViewController.swift
//  DemoSaveDataLocal
//
//  Created by iMac_VTCA on 1/10/20.
//  Copyright © 2020 iMac_VTCA. All rights reserved.
//

import UIKit

class Model1: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.age, forKey: "age")
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as? String ?? ""
        self.age = coder.decodeObject(forKey: "age") as? Int ?? 0
    }
    

    
    let name: String
    let age: Int
    
    init(a: String, b: Int) {
        self.name = a
        self.age = b
    }
}

struct Vehicle: Codable {
    var name: String
    var year: Int
}

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "valueTypeClass")
    }

    @IBAction func saveButton_Clicked(_ sender: UIButton) {
        let text = myTextField.text ?? ""
        
        let userDefault = UserDefaults.standard
        
        if text == "" {
            return
        }

        userDefault.set(text, forKey: "myText")
        
        // # Cách 1:
        if let value = userDefault.value(forKey: "myText") as? String {
            print(value)
        }
        // # Cách 2:
        if let value2 = UserDefaults.standard.value(forKey: "myText") as? String {
            print(value2)
        }
        // # Cách 3:
        if let value3 = userDefault.string(forKey: "myText") {
            print(value3)
        }
        
        //userDefault.removeObject(forKey: "myText")
    }
    
    @IBAction func saveButton_Clicked_UserDefault(_ sender: UIButton) {
        let userDefault = UserDefaults.standard
        
        let valueInt = 1
        userDefault.set(valueInt, forKey: "valueTypeInt")
        
        let valueBoolean = true
        userDefault.set(valueBoolean, forKey: "valueTypeBoolean")
        
        let arrayString = ["abc", "def", "ghi"]
        userDefault.set(arrayString, forKey: "valueTypeAny_arrayString")
        
        let dictionary: [String: String] = ["id": "1", "name": "nghia", "age": "23"]
        userDefault.set(dictionary, forKey: "valueTypeDictionary")
        
        // lưu kiểu class ( struct không được ??? )
        // Tạo class ở trên kế thừa NSObject và NSCoding
        let model1 = Model1(a: "Nghia", b: 1996)
        let classToData = try! NSKeyedArchiver.archivedData(withRootObject: model1, requiringSecureCoding: false)
        userDefault.set(classToData, forKey: "valueTypeClass")

        //
        
        // lưu kiểu struct ( sử dụng Codable )
        let car = Vehicle(name: "BMW", year: 2020)
        let structCarToDataJSON = try! JSONEncoder().encode(car)
        userDefault.set(structCarToDataJSON, forKey: "valueTypeStruct")

        //
        let value1 = userDefault.integer(forKey: "valueTypeInt")
        print(value1)
        
        let value2 = userDefault.bool(forKey: "valueTypeBoolean")
        print(value2)
        
        if let value3 = userDefault.array(forKey: "valueTypeAny_arrayString") as? [String] {
            print(value3)
        }
        
        if let value4 = userDefault.dictionary(forKey: "valueTypeDictionary") as? [String: String] {
            print(value4)
        }

        if let value5 = userDefault.object(forKey: "valueTypeClass") as? Data {
            if let dataToClass = try! NSKeyedUnarchiver.unarchivedObject(ofClass: Model1.self, from: value5) {
                print(dataToClass)
            }
        }
        
        if let value6 = userDefault.value(forKey: "valueTypeStruct") as? Data {
            let dataToStruct = try! JSONDecoder().decode(Vehicle.self, from: value6)
            print(dataToStruct)
        }
        
        // kiểm tra tất  cả key của userDefault
        
        // Freelance page
        // https://pangara.com/
        
    }
}

