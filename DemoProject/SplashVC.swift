//
//  ViewController.swift
//  DemoProject
//
//  Created by EPIC on 30/09/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            self.navigationController?.navigationBar.isHidden = false
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
           // vc.modalPresentationStyle = .overFullScreen
           // self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


}

