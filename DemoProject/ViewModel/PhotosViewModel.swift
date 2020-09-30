//
//  File.swift
//  DemoProject
//
//  Created by EPIC on 01/10/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation

struct PhotosViewModel {
    
    weak var dataSource : GenericDataSource<RootModel>?
    var onErrorHandling : ((ErrorResult?) -> Void)?

    init(_ dataSource: GenericDataSource<RootModel>?) {
        self.dataSource = dataSource
    }
    
    func fetchData(_ page: String){
        RequestService.shared.loadData(page: page) { (result) in
            switch result{
            case .success(let data):
                do{
                    let jsonD = JSONDecoder()
                    let resp = try jsonD.decode([RootModel].self, from: data)
                    self.dataSource?.data.value = resp
                }catch{
                    self.onErrorHandling?(.custom(string: "Unable to decode the json response"))
                }
                break
            case .failure(let error):
                self.onErrorHandling?(.custom(string: error.localizedDescription))
                break
            }
        }
    }
    
}
