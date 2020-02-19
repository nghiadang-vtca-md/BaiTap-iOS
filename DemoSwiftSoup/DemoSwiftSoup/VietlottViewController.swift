//
//  VietlottViewController.swift
//  DemoSwiftSoup
//
//  Created by nghiadang1205 on 2/7/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import SwiftSoup

class VietlottViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let results = crawlResult(start: 516, next: 20)
//        if let results = results {
//            for res in results {
//                print(res, separator: "-", terminator: "\n")
//            }
//        }
    }
    func crawlResult(start: Int, next: Int) -> [[String]]?{
        let numberOfResult = next
        var results: [[String]]? = []
        
        for i in 0..<numberOfResult {
            let urlString = "https://vietlott.vn/vi/trung-thuong/ket-qua-trung-thuong/645?id=00" + String(start + i) + "&nocatche=1"
            let url = URL(string: urlString)
            let html = try! String(contentsOf: url!, encoding: .utf8)
            do {
                let doc: Document = try SwiftSoup.parse(html)
                // Cách 1:
//                let elements: Elements = try doc.getElementsByClass("bong_tron")
                
//                var res: [String] = []
//
//                for p in elements {
//                    //print(try p.text(), terminator: "-")
//                    res.append(try p.text())
//                }
//                results?.append(res)
                
                // cách 2:
//                let elements2: Element = try doc.getElementsByClass("day_so_ket_qua_v2").first()!
//                let str = try elements2.text()
//                //          11 22 33 44 55 66
//                // index    01 23 45 67 89 1011
//                let s1 = str.substring(to: 2) // Hello
//                let s2 = str.substring(with: 2..<4)
//                let s3 = str.substring(with: 4..<6)
//                let s4 = str.substring(with: 6..<8)
//                let s5 = str.substring(with: 8..<10)
//                let s6 = str.substring(from: 10)
//                print(s1,s2,s3,s4,s5,s6, separator: "-", terminator: "\n")
                // Cách 3:
                let elements3: [Element] = try doc.select("span.bong_tron").array()
                let quantity = elements3.count
                for (index,element) in elements3.enumerated() {
                    if index == quantity - 1 {
                        print(try element.text())
                    } else {
                        print(try element.text(), terminator: "-")
                    }
                }
            } catch Exception.Error(type: let type, Message: let message) {
                print(type)
                print(message)
            } catch {
                print("error")
            }
        }
        return results
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

//let str = "Hello, playground"
//print(str.substring(from: 7))         // playground
//print(str.substring(to: 5))           // Hello
//print(str.substring(with: 7..<11))    // play
