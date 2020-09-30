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
        
    var data: [RootModel] = []
    let viewModel = PhotosViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        //
        self.title = "Home"
        
        //
        self.tableView.estimatedRowHeight = 200 // Estimated default row height
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.viewModel.fetchData("2") { (result) in
            switch result{
            case .success(let array):
                self.data = array
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                break
            case .failure(let error):
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
