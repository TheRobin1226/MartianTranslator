//
//  ArticleListInteractor.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class ArticleListInteractor: ArticleListInteractorInputProtocol {
    var presenter: ArticleListInteractorOutputProtocol?
    var topImages: [UIImage] = []
    
    func fetchArticlesFromJSON() {
        if let url = URL(string: "https://s1.nyt.com/ios-newsreader/candidates/test/articles.json") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                    let jsonData = try JSONDecoder().decode([ArticleListModel].self, from: data)
                    for article in jsonData {
                        for image in article.images {
                            if (image.top_image) {
                                if let url = URL(string: image.url) {
                                    do {
                                        let data = try Data(contentsOf: url)
                                        self.topImages.append(UIImage(data: data)!)
                                    } catch {
                                        self.topImages.append(UIImage(named: "ImageComingSoon")!)
                                    }
                                }
                            }
                        }
                    }
                    OperationQueue.main.addOperation({
                        self.presenter?.articlesFetchedSuccess(articleArray: jsonData, topImagesArray: self.topImages)
                    })
                  } catch let error {
                    self.presenter?.articlesFetchFailed(errorMessage: error.localizedDescription)
                  }
               }
           }.resume()
        }
    }
    
}
