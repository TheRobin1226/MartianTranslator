//
//  ArticleViewController.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class ArticleViewController: UIViewController {
    
    var articleModel: ArticleModel?
    
    init(articleModel: ArticleModel) {
        self.articleModel = articleModel
        super.init(nibName: "ArticleViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.articleModel)
    }
}
