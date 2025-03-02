//
//  ArticlePresenter.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class ArticlePresenter: ArticlePresenterProtocol, ArticleInteractorOutputProtocol {
    
    var view: ArticleViewProtocol?
    
    var interactor: ArticleInteractorInputProtocol?
    
    var router: ArticleRouterProtocol?
    
    func goBack(navigationController: UINavigationController) {
        router?.goBack(navigationController: navigationController)
    }
    
    func articleTranslationSuccess(articleModel: ArticleModel) {
        view?.presentArticleTranslation(articleModel: articleModel)
    }
    
    func startMartianTranslation(articleModel: ArticleModel) {
        interactor?.fetchMartianTranslation(articleModel: articleModel)
    }
}
