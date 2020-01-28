//
//  ArticleRouter.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class ArticleRouter: ArticleRouterProtocol {
    func goBack(navigationController: UINavigationController) {
        NavigationHelper.sharedInstance.goBack(navigationController: navigationController, animated: true)
    }
    
    static func createArticleModule(articleModel: ArticleModel) -> ArticleViewController {
        let view = ArticleViewController(articleModel: articleModel)
        
        let presenter: ArticlePresenterProtocol & ArticleInteractorOutputProtocol = ArticlePresenter()
        let interactor: ArticleInteractorInputProtocol = ArticleInteractor()
        let router: ArticleRouterProtocol = ArticleRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
