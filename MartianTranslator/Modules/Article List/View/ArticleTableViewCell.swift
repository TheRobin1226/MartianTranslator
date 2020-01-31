//
//  ArticleTableViewCell.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/30/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    
    override func awakeFromNib() {
        articleTitle.textColor = Constants.gold
    }
}
