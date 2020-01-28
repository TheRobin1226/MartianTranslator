//
//  ArticleProtocols.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

// View -> Presenter
protocol ArticlePresenterProtocol: class {
    
    var view: ArticleViewProtocol? { get set }
    var interactor: ArticleInteractorInputProtocol? { get set }
    var router: ArticleRouterProtocol? { get set }
    func goBack(navigationController: UINavigationController)
    
}

// Presenter -> View
protocol ArticleViewProtocol: class {
    var presenter: ArticlePresenterProtocol? { get set }
    func presentArticleTranslation(articleTranslatedText: String)
}

// Presenter -> Router
protocol ArticleRouterProtocol: class {
    static func createArticleModule(articleModel: ArticleModel) -> ArticleViewController
    func goBack(navigationController: UINavigationController)
}

// Presenter -> Interactor
protocol ArticleInteractorInputProtocol: class {
    var presenter: ArticleInteractorOutputProtocol? { get set }
    func fetchTranslationOfArticle()
}

// Interactor -> Presenter
protocol ArticleInteractorOutputProtocol: class {
    func articlesTranslationSuccess(articleTranslatedText: String)
}
