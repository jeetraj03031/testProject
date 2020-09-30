//
//  ListTableViewCell.swift
//  DemoProject
//
//  Created by EPIC on 01/10/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit
import Nuke

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblAuthorName: UILabel!
    
    //ImageView Loading Options
    let options = ImageLoadingOptions(
        placeholder: UIImage(named: "placeholder"),
        transition: .fadeIn(duration: 0.2),
        contentModes: .init(success: .scaleAspectFit, failure: .center, placeholder: .scaleAspectFit)
        
    )
    
    var imgURL: String = ""{
        didSet{
            Nuke.loadImage(with: URL(string: imgURL)!,options: options, into: self.imgView)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
