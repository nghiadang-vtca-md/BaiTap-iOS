//
//  ViewController.swift
//  FileDemo
//
//  Created by iMac_VTCA on 12/13/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //
//        let fileManager = FileManager.default
//        let currentPath = fileManager.currentDirectoryPath
//        print(currentPath)
//        //
//        // đường dẫn của Documents
//        let dirPaths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//        let docsDir = dirPaths[0].path
//        print(docsDir)
//        //
//        // Xác định thư mục tạm (tmp)
//        let tmpDir = NSTemporaryDirectory()
//        print(tmpDir)
//        //
//        // Thay đổi thư mục hiện hành (Vd: từ / sang /documents )
//        if fileManager.changeCurrentDirectoryPath(docsDir) {
//            print("success")
//        } else {
//            print("fail")
//        }
//        //
//        // Tạo thư mục mới sau path
//        let newDir = dirPaths[0].appendingPathComponent("data").path
//        do {
//            try fileManager.createDirectory(atPath: newDir, withIntermediateDirectories: false, attributes: nil) // lưu ý thuộc tính true "withIntermediateDirectories"
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        //
//        // Xoá thư mục
//        do {
//            try fileManager.removeItem(atPath: newDir)
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        //
//        // Liệt kê danh sách của dicrectory (contentsOfDirectory)
//        do {
//            // lùi về thư mục cha 1 cấp (folder gần nhất so với hiện tại)
//            let backFolder = dirPaths[0].deletingLastPathComponent().path
//            //let backFolder = dirPaths[0].lastPathComponent
//            //print(backFolder)
//            //
//            //let fileList = try fileManager.contentsOfDirectory(atPath: "/")
//            let fileList = try fileManager.contentsOfDirectory(atPath: backFolder)
//            for fileName in fileList {
//                print(fileName)
//            }
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        //
//        // kiểm tra file hoặc directory (attributesOfItem)
//        do {
//            let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//            print(dirPaths)
//            let path = "/Users/imac_vtca/Library/Developer/CoreSimulator/Devices/9AFDFC13-0985-47F2-B66F-B002B9FB9BB2/data/Containers/Data/Application/7F4F3FF0-5F30-4694-8A2B-D322F3715771/Documents/pikachu.jpg"
//            let attribs: Dictionary = try fileManager.attributesOfItem(atPath: path) as Dictionary
//            let type = attribs[FileAttributeKey.type] as! String
//            print("\(type) --------")
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        //
//        // Kiểm tra sự tồn tại của 1 file
//        // ???? tại sao không được
//        // giải thích -> copy path đưa vào "Go to folder" là biết
//        let path = "/Users/imac_vtca/Library/Developer/CoreSimulator/Devices/9AFDFC13-0985-47F2-B66F-B002B9FB9BB2/data/Containers/Data/Application/7F4F3FF0-5F30-4694-8A2B-D322F3715771/Documents/pikachu.jpg"
//        if fileManager.fileExists(atPath: path) {
//            print("File exists")
//        } else {
//            print("File not found")
//        }
        
        // so sánh nội dung 2 file - comment tất cả trước khi chạy
        // kiểm tra đọc ghi xoá thực thi
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        let fileManager = FileManager.default
        let file1 = "pikachu.jpg"
        let file2 = "pikachu2.jpg"
//        let file1 = "file1.txt"
//        let file2 = "file2.txt"
        if let pathComponent1 = url.appendingPathComponent(file1) {
            if let pathComponent2 = url.appendingPathComponent(file2) {
                let filePath1 = pathComponent1.path
                let filePath2 = pathComponent2.path

                let isEqual = fileManager.contentsEqual(atPath: filePath1, andPath: filePath2)

                if isEqual {
                    print("\(file1) is equal to \(file2)")
                } else {
                    print("\(file1) is NOT equal to \(file2)")
                }
                
                // Kiểm tra quyền đọc ghi
                if fileManager.isReadableFile(atPath: filePath1) {
                    print("isReadableFile")
                }
                if fileManager.isWritableFile(atPath: filePath1) {
                    print("isWritableFile")
                }
                if fileManager.isDeletableFile(atPath: filePath1) {
                    print("isDeletableFile")
                }
                if fileManager.isExecutableFile(atPath: filePath1) {
                    print("isExecutableFile")
                }
            }
        }
        //
        // Di chuyển - copy - remove file
//        fileManager.moveItem(atPath: <#T##String#>, toPath: <#T##String#>)
//        fileManager.copyItem(atPath: <#T##String#>, toPath: <#T##String#>)
//        fileManager.removeItem(atPath: <#T##String#>)
        // 1. Move file
        let pathToMove = path + "/moveItem-Folder/" + file1
        print(pathToMove)
        if let pathComponent1 = url.appendingPathComponent(file1) {
            let filePath1 = pathComponent1.path
            //let filename = pathComponent1.lastPathComponent // lấy tên file
            //print(filename)
            print(filePath1)
            if fileManager.fileExists(atPath: filePath1) {
                do {
                    // chú ý: toPath phải chứa tên của file hoặc là đường dẫn
                    try fileManager.moveItem(atPath: filePath1, toPath: pathToMove)
                    print("move success!")
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                print("File not found")
            }
            
        }
        // 2. Copy file
        let pathToCopy = path + "/copyItem-Folder/" + file2
        print(pathToCopy)
        if let pathComponent2 = url.appendingPathComponent(file2) {
            let filePath2 = pathComponent2.path
            print(filePath2)
            if fileManager.fileExists(atPath: filePath2) {
                do {
                    try fileManager.copyItem(atPath: filePath2, toPath: pathToCopy)
                    print("copy success!")
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                print("File not found")
            }
        }
        // 3. Remove file
        
        //
    }


}

/*
 1. Phân biệt đường dẫn giữa simulator và thiết bị thật
 2.
 */

