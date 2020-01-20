//
//  ArticleListViewController.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var articleTableViewCell: UITableView!
    var presenter: ArticleListPresenterProtocol?
    var articleArray: [ArticleListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Name Coming Soon"
        
        presenter?.startFetchingArticles()
        
        articleTableViewCell.delegate = self
        articleTableViewCell.dataSource = self
    }
    
    static func instantiate() -> ArticleListViewController {
        return UIStoryboard(name: "ArticleListViewController", bundle: nil).instantiateViewController(withIdentifier: "ArticleListViewController") as! ArticleListViewController
    }
    
    
}

extension ArticleListViewController: ArticleListViewProtocol {
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showArticle(articleArray: [ArticleListModel]) {
        self.articleArray = articleArray
        self.articleTableViewCell.reloadData()
    }
    
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentArticleViewController()
    }
    
}

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
}
