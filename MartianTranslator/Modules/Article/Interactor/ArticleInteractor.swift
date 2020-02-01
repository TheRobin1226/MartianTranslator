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
    
    func fetchMartianTranslation(articleText: String) {
        let c = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'")
        let articleCharsArray = Array(articleText)
        var tempWord = ""
        var tempTranslatedText = ""
        for char in articleCharsArray {
            if c.contains(char) {
                tempWord.append(char)
            } else if char == " " {
                tempTranslatedText.append(self.translateWord(word: tempWord))
                tempWord = ""
                tempTranslatedText.append(" ")
            } else {
                tempTranslatedText.append(self.translateWord(word: tempWord))
                tempWord = ""
                tempTranslatedText.append(char)
            }
        }
        
        presenter?.articlesTranslationSuccess(articleTranslatedText: tempTranslatedText)
    }

}

// MARK: - Private
private extension ArticleInteractor {
    func translateWord(word: String) -> String {
        let charSet = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let upperCaseSet = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
        let charCount = word.filter({charSet.contains($0)}).count
        let upperCaseCount = word.filter({upperCaseSet.contains($0)}).count
        let numbersRange = word.rangeOfCharacter(from: .decimalDigits)
        
        if charCount > 3 {
            return upperLowerBoinga(word: word, charCount: charCount, upperCaseCount: upperCaseCount)
        } else if numbersRange != nil && charCount > 1 {
            return upperLowerBoinga(word: word, charCount: charCount, upperCaseCount: upperCaseCount)
        } else {
            return word
        }
    }
    
    func upperLowerBoinga(word: String, charCount: Int, upperCaseCount: Int) -> String {
        if upperCaseCount == charCount {
            return "BOINGA"
        } else if word.first!.isUppercase {
            return "Boinga"
        } else {
            return "boinga"
        }
    }
}
