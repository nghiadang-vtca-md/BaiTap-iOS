//
//  ViewController2.swift
//  FileDemo
//
//  Created by iMac_VTCA on 12/16/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//  Tiếp tục ngàY -> ghi file

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // CREATE FILE
        let fileManager = FileManager.default
        let strDataToWrite = "Hello World".data(using: .utf8)
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        let documentPath = NSURL(fileURLWithPath: path)
        guard let fileName = documentPath.appendingPathComponent("text.txt")?.path else {
            return
        }
        
        print(fileName)
        let isCreateSuccess = fileManager.createFile(atPath: fileName, contents: strDataToWrite, attributes: nil)
        print(isCreateSuccess)
        
        if let dataData = fileManager.contents(atPath: fileName) {
            let dataStr = String(decoding: dataData, as: UTF8.self)
            print(dataStr)
        }
        //  FILE HANDLE
        let file: FileHandle? = FileHandle(forReadingAtPath: fileName)
        
        if file == nil {
            print("File open faild")
        } else {
            do {
                try file?.seek(toOffset: 3)
                //TH1:  đọc từ offset thứ 3, lấy 5 kí tự
//                if let dataBuffer = file?.readData(ofLength: 5) {
//                    let dataStr = String(decoding: dataBuffer, as: UTF8.self)
//                    print(dataStr)
//                }
                //
                //TH2: đọc từ offset 3, lấy đến cuối file
                if let dataBuffer = file?.readDataToEndOfFile() {
                    let dataStr = String(decoding: dataBuffer, as: UTF8.self)
                    print(dataStr)
                }
                //
                // nhớ phải đóng file
                file?.closeFile()
                //
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        
        // ghi file (ghi đè)
        guard let fileNameVD2 = documentPath.appendingPathComponent("testFileVD2.txt")?.path else {
            return
        }
        print(fileNameVD2)
        let fileVD2: FileHandle? = FileHandle(forUpdatingAtPath: fileNameVD2)
        if fileVD2 == nil {
            print("File open failed")
        } else {
            if let data = ("black cat" as NSString).data(using: String.Encoding.utf8.rawValue) {
                do {
                    readFile(fileHandle: fileVD2, note: "Before:") // hàm này tự viết
                    
                    try fileVD2?.seek(toOffset: 10)
                    fileVD2?.write(data)
                    
                    readFile(fileHandle: fileVD2, note: "After: ") // hàm này tự viết
                    
                    //
                    fileVD2?.closeFile()
                    //
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }
        }
        // end  ghi file (ghi đè)
        
    }
    func readFile(fileHandle: FileHandle?, note: String) {
        do {
            try fileHandle?.seek(toOffset: 0)
            if let dataReadAfterWrite = fileHandle?.readDataToEndOfFile() {
                let str = String(decoding: dataReadAfterWrite, as: UTF8.self)
                print(note, str)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
