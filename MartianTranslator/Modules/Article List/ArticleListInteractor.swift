//
//  ArticleListInteractor.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation

class ArticleListInteractor: ArticleListInteractorInputProtocol {
    var presenter: ArticleListInteractorOutputProtocol?
    
    func fetchArticlesFromJSON() {
        if let url = URL(string: "https://s1.nyt.com/ios-newsreader/candidates/test/articles.json") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                    let jsonData = try JSONDecoder().decode([ArticleListModel].self, from: data)
                    self.presenter?.articlesFetchedSuccess(articleArray: jsonData)
                  } catch let error {
                    self.presenter?.articlesFetchFailed(errorMessage: error.localizedDescription)
                  }
               }
           }.resume()
        }
    }
    
}
