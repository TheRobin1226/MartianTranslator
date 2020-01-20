//
//  ArticleListPresenter.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation

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
    
    func articlesFetchedSuccess(articleArray: [ArticleListModel]) {
        view?.showArticle(articleArray: articleArray)
    }
    
    func articlesFetchFailed(errorMessage: String) {
        view?.showError(message: errorMessage)
    }
    
    
}
