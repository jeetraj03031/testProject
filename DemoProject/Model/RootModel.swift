//
//  RootModel.swift
//  DemoProject
//
//  Created by EPIC on 01/10/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation


struct RootModel : Codable {

        let author : String?
        let downloadUrl : String?
        let height : Int?
        let id : String?
        let url : String?
        let width : Int?

        enum CodingKeys: String, CodingKey {
                case author = "author"
                case downloadUrl = "download_url"
                case height = "height"
                case id = "id"
                case url = "url"
                case width = "width"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                author = try values.decodeIfPresent(String.self, forKey: .author)
                downloadUrl = try values.decodeIfPresent(String.self, forKey: .downloadUrl)
                height = try values.decodeIfPresent(Int.self, forKey: .height)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                url = try values.decodeIfPresent(String.self, forKey: .url)
                width = try values.decodeIfPresent(Int.self, forKey: .width)
        }

}
