//
//  ArticleInteractor.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation

class ArticleInteractor: ArticleInteractorInputProtocol {
    
    var presenter: ArticleInteractorOutputProtocol?
    
    func fetchTranslationOfArticle(articleText: String) {
        presenter?.articlesTranslationSuccess(articleTranslatedText: "Success")
    }
    
    
    
}
