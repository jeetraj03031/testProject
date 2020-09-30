//
//  File.swift
//  DemoProject
//
//  Created by EPIC on 01/10/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation

class PhotosViewModel: NSObject {
    

    func fetchData(_ page: String,completion: @escaping(Result<[RootModel],ErrorResult>)->Void){
        RequestService.shared.loadData(page: page) { (result) in
            switch result{
            case .success(let data):
                do{
                    let jsonD = JSONDecoder()
                    let resp = try jsonD.decode([RootModel].self, from: data)
                    completion(.success(resp))
                }catch{
                    completion(.failure(.parser(string: "Unable to decode Response")))
                }
                break
            case .failure(let error):
                completion(.failure(.network(string: "Ooops Something Went Wrong")))
                break
            }
        }
    }
    
}
