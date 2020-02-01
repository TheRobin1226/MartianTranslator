//
//  ArticleListRouter.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class ArticleListRouter: ArticleListRouterProtocol {

    static func presentArticleListModule(fromView: AnyObject) {
        let view: ArticleListViewProtocol = ArticleListViewController.instantiate()
        
        let presenter: ArticleListPresenterProtocol & ArticleListInteractorOutputProtocol = ArticleListPresenter()
        let interactor: ArticleListInteractorInputProtocol = ArticleListInteractor()
        let router: ArticleListRouterProtocol = ArticleListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        let viewController = view as! ArticleListViewController
        NavigationHelper.setRootViewController(withViewController: viewController)
    }
    
    func presentArticleModule(navigationController: UINavigationController, articleModel: ArticleModel) {
        let articleViewController = ArticleRouter.createArticleModule(articleModel: articleModel)
        NavigationHelper.pushViewController(navigationController: navigationController, viewController: articleViewController, animated: true)
    }
}
