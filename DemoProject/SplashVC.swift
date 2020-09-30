//
//  ViewController.swift
//  DemoProject
//
//  Created by EPIC on 30/09/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit
import SwiftyGif

class SplashVC: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        do{
            let gif = try UIImage(gifName: "logo.gif")
            self.imgView.setGifImage(gif, loopCount: -1) // Will loop forever
        }catch{
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            
            self.navigationController?.navigationBar.isHidden = false
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


}

