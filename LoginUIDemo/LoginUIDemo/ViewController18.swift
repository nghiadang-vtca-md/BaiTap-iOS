//
//  ViewController18.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 11/1/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit
import WebKit
class ViewController18: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    
    @IBOutlet weak var backButtonItem: UIBarButtonItem!
    @IBOutlet weak var forwardButtonItem: UIBarButtonItem!
    @IBOutlet weak var reloadButtonItem: UIBarButtonItem!
    @IBOutlet weak var loadHTMLButtonItem: UIBarButtonItem!
    
    
    
    @IBAction func backButton_Tap(_ sender: UIBarButtonItem) {
        if myWebView.canGoBack {
            myWebView.goBack()
        }
        
    }
    
    @IBAction func forwardButton_Tap(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    @IBAction func reloadButton_Tap(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func loadHTMLButton_Tap(_ sender: UIBarButtonItem) {
        if let url = Bundle.main.url(forResource: "zing", withExtension: "html") {
            myWebView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        //
        let urlString = "https://nld.com.vn/"
        //
        guard let url = URL(string: urlString) else { return }
        //
        let urlRequest = URLRequest(url: url)
        //
        myWebView.load(urlRequest)
        // dùng để vuốt trái phải
        myWebView.allowsBackForwardNavigationGestures = true
    }
    

    /*
     Để sử dụng WEbKit thì phải add LIBRARY và IMPORT vào
     - B1: chọn project -> Build Phase -> Link Binary ... -> Nhập keyword "Web" -> add
     - B2: Ở ViewController import WebKit
     
     sử dụng delegate để lấy được các status của WebView
     - myWebView.navigationDelegate = self
     - mở rộng extension ViewController18: WKNavigationDelegate
     - lấy 2 hàm của protocol:
     
    nghiên cứu thêm
     - hackingwithswift ... the ultimate guide to wkwebview
    */

}

extension ViewController18: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Loaded")
        
        backButtonItem.isEnabled = myWebView.canGoBack
        forwardButtonItem.isEnabled = myWebView.canGoForward
        reloadButtonItem.isEnabled = true
        
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Load error!!! \(error.localizedDescription)")
    }
}
