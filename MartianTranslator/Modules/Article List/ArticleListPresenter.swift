//
//  ArticleListPresenter.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class ArticleListPresenter: ArticleListPresenterProtocol, ArticleListInteractorOutputProtocol {
    
    var view: ArticleListViewProtocol?
    
    var interactor: ArticleListInteractorInputProtocol?
    
    var router: ArticleListRouterProtocol?
    
    func startFetchingArticles() {
        interactor?.fetchArticlesFromJSON()
    }
    
    func presentArticleViewController() {
        router?.presentArticleModule()
    }
    
    func articlesFetchedSuccess(articleArray: [ArticleListModel], topImagesArray: [UIImage]) {
        view?.showArticle(articleArray: articleArray, topImagesArray: topImagesArray)
    }
    
    func articlesFetchFailed(errorMessage: String) {
        view?.showError(message: errorMessage)
    }
    
    
}
