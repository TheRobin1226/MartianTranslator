//
//  ArticleListProtocols.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation

// View -> Presenter
protocol ArticleListPresenterProtocol: class {
    
    var view: ArticleListViewProtocol? { get set }
    var interactor: ArticleListInteractorInputProtocol? { get set }
    var router: ArticleListRouterProtocol? { get set }
    func startFetchingArticles()
    func presentArticleViewController()
    
}

// Presenter -> View
protocol ArticleListViewProtocol: class {
    var presenter: ArticleListPresenterProtocol? { get set }
    func showError(message: String)
    func showArticle(articleArray: [ArticleListModel])
}

// Presenter -> Router
protocol ArticleListRouterProtocol: class {
    static func presentArticleListModule(fromView: AnyObject)
    func presentArticleModule()
}

// Presenter -> Interactor
protocol ArticleListInteractorInputProtocol: class {
    var presenter: ArticleListInteractorOutputProtocol? { get set }
    func fetchArticlesFromJSON()
}

// Interactor -> Presenter
protocol ArticleListInteractorOutputProtocol: class {
    func articlesFetchedSuccess(articleArray: [ArticleListModel])
    func articlesFetchFailed(errorMessage: String)
}
