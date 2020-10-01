//
//  ListViewController.swift
//  DemoProject
//
//  Created by EPIC on 30/09/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    //ViewModel Object
    let dataSource = UserDataSource()
    
    lazy var viewModel : PhotosViewModel = {
        let viewModel = PhotosViewModel(dataSource)
        return viewModel
    }()
    
    private let refreshControl = UIRefreshControl()
    private let activityColor: UIColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Home"
        
        tableView.dataSource = self.dataSource
        
        self.tableView.estimatedRowHeight = 150 // Estimated default row height
        self.tableView.rowHeight = UITableView.automaticDimension
        
        addRefreshControl()
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            }
        }
       
        fetchData()
    }
    
    func addRefreshControl(){
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        // Configure Refresh Control
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching User Data...",attributes: [NSAttributedString.Key.foregroundColor: activityColor])
        refreshControl.tintColor = activityColor
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
    }
    
    @objc func fetchData(){
        self.viewModel.fetchData("2")
    }

    
}
