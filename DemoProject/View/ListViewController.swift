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
    
    //Data For Tableview
    var data: [RootModel] = []
    
    //ViewModel Object
    let viewModel = PhotosViewModel()
    private let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Home"
        tableView.delegate = self
        tableView.dataSource = self
        //
        self.tableView.estimatedRowHeight = 200 // Estimated default row height
        self.tableView.rowHeight = UITableView.automaticDimension
        
        addRefreshControl()
        
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
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching User Data...")
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
    }
    
    @objc func fetchData(){
        self.viewModel.fetchData("2") { (result) in
            switch result{
            case .success(let array):
                self.data = array
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.tableView.reloadData()
                }
                break
            case .failure(let _):
                break
            }
        }
    }

    
}
extension ListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        cell.imgURL = data[indexPath.row].downloadUrl ?? ""
        cell.lblAuthorName.text = data[indexPath.row].author ?? ""
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
