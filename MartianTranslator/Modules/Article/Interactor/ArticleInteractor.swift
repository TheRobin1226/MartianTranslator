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
    
    func fetchMartianTranslation(articleModel: ArticleModel) {
        presenter?.articleTranslationSuccess(articleModel: ArticleModel(body: fetchTranslated(text: articleModel.body),
                                                                        title: fetchTranslated(text: articleModel.title),
                                                                        topImage: articleModel.topImage))
    }
    
    func fetchTranslated(text: String) -> String {
        let charsArray = Array(text)
        
        var tempWord = ""
        var tempTranslatedText = ""
        
        for char in charsArray {
            if Constants.charSets.charSetPlusApostrophe.contains(char) {
                tempWord.append(char)
            } else if char == " " {
                tempTranslatedText.append(translateWord(word: tempWord))
                tempWord = ""
                tempTranslatedText.append(" ")
            } else {
                tempTranslatedText.append(translateWord(word: tempWord))
                tempWord = ""
                tempTranslatedText.append(char)
            }
        }
        
        tempTranslatedText.append(translateWord(word: tempWord))
        return tempTranslatedText
    }
    
    func translateWord(word: String) -> String {
        let charCount = word.filter({Constants.charSets.charSet.contains($0)}).count
        let upperCaseCount = word.filter({Constants.charSets.upperCaseSet.contains($0)}).count
        let numbersRange = word.rangeOfCharacter(from: .decimalDigits)
        
        if charCount > 3 {
            return upperLowerBoinga(word: word, charCount: charCount, upperCaseCount: upperCaseCount)
        } else if numbersRange != nil && charCount > 0 {
            return upperLowerBoinga(word: word, charCount: charCount, upperCaseCount: upperCaseCount)
        } else {
            return word
        }
    }
    
    func upperLowerBoinga(word: String, charCount: Int, upperCaseCount: Int) -> String {
        if upperCaseCount == charCount {
            return Constants.boingaVariations.upperCaseBoinga
        } else if word.first!.isUppercase {
            return Constants.boingaVariations.firstLetterUpperCaseBoinga
        } else {
            return Constants.boingaVariations.lowerCaseboinga
        }
    }
}
