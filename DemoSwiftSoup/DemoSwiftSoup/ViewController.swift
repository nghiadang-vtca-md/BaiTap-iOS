//
//  ViewController.swift
//  DemoSwiftSoup
//
//  Created by nghiadang1205 on 2/7/20.
//  Copyright © 2020 nghiadang1205. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let html = "<!DOCTYPE html><html><body><h1>My First Heading</h1><p>My first paragraph</p><a class='mylink' id='applelink' href='http://www.apple.com'>Link to apple's website</a><ul><li>Item 1</li><li>Item 2</li><li>Item 3</li><li>Item 4</li></ul></body></html>"
            let doc: Document = try SwiftSoup.parse(html)
            
            let p: Element = try doc.select("p").first()!
            print(try p.text())

            let a: Element = try doc.select("a").first()!
            let link: String = try a.attr("href")
            let text: String = try a.text()

            let className: String = try a.className()
            let idName: String = a.id()
            
            let li:[Element] = try doc.select("li").array()
            
            print(li[2])
            print(link)
            print(text)
            print(className)
            print(idName)
            
        } catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        } catch {
            print("error")
        }
    }


}

