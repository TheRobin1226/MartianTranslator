//
//  ArticleListViewController.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

final class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var articleTableView: UITableView!
    var presenter: ArticleListPresenterProtocol?
    var articleArray: [ArticleListModel] = []
    var topImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "The Alien Times"
        
        presenter?.startFetchingArticles()
        
        articleTableView.delegate = self
        articleTableView.dataSource = self
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
    
    func showArticle(articleArray: [ArticleListModel], topImagesArray: [UIImage]) {
        self.articleArray = articleArray
        self.topImages = topImagesArray
        DispatchQueue.main.async {
            self.articleTableView.reloadData()
        }
    }
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        
        cell.articleImage.image = self.topImages[indexPath.row]
        cell.articleTitle.text = self.articleArray[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleModel: ArticleModel = ArticleModel(body: self.articleArray[indexPath.row].body,
                                                      title: self.articleArray[indexPath.row].title,
                                                      topImage: self.topImages[indexPath.row])
        
        presenter?.presentArticleViewController(navigationController: navigationController!, articleModel: articleModel)
    }
    
}

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
}
