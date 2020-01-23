//
//  ArticleListRouter.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation

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
    
    func presentArticleModule() {
        // Navigate to Article View Controller
    }
    
    
}
