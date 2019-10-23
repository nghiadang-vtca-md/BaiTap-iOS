//
//  ViewController8.swift
//  LoginUIDemo
//
//  Created by iMac_VTCA on 10/23/19.
//  Copyright © 2019 iMac_VTCA. All rights reserved.
//

import UIKit

class ViewController8: UIViewController {
    // PageControl
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBAction func btnNextPage(_ sender: UIButton) {
        currentPage += 1
        myPageControl.currentPage = currentPage
        checkHideShowButton(currentPage: currentPage)
    }
    @IBAction func btnPreviousPage(_ sender: UIPageControl) {
        currentPage -= 1
        myPageControl.currentPage = currentPage
        checkHideShowButton(currentPage: currentPage)
    }
    
    
    var currentPage = 0
    
    func checkHideShowButton(currentPage: Int) {
        switch currentPage {
        case 0:
            btnNext.isHidden = false
            btnPrevious.isHidden = true
        case 9:
            btnNext.isHidden = true
            btnPrevious.isHidden = false
        default:
            btnNext.isHidden = false
            btnPrevious.isHidden = false
        }
    }
    // end PageControl
    // for ImageView
    var array: [UIImage] = []
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    
    
    @IBAction func startAction(_ sender: UIButton) {
        contentImageView.startAnimating()
        btnStart.isHidden = true
        btnStop.isHidden = false
        
    }
    @IBAction func stopAction(_ sender: UIButton) {
        contentImageView.stopAnimating()
        btnStart.isHidden = false
        btnStop.isHidden = true
    }
    
    // end ImageView
    
    // for load from Internet
    
    @IBOutlet weak var imageViewLoadFromInternet: UIImageView!
    
    @IBAction func loadFromInternet(_ sender: UIButton) {
        let urlString = "https://fsmedia.imgix.net/07/05/10/11/b2e4/4575/937c/7b9a134d6ae4/5pikachu-1gif.gif?rect=0%2C0%2C1000%2C500&auto=compress&dpr=2&w=650&fm=jpg"
        
        guard let url = URL(string: urlString) else { return } // vì URL có thẻ bằng nil
        
        let data = try! Data(contentsOf: url) // vì có throw nên sử dụng try! , // bat dong bo
        
        imageViewLoadFromInternet.image = UIImage(data: data)
    }
    
    
    // end load from Internet
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // PageControl
        myPageControl.currentPage = currentPage
        // end PageControl
        
        // for ImageView
        (1...10).forEach { (i) in
            if let image = UIImage(named: "\(i).jpeg"){
                array.append(image)
            }
        }
        
        contentImageView.animationImages = array
        contentImageView.animationDuration = 10
         // end ImageView
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
