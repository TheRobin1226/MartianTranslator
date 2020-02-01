//
//  MartianTranslatorTests.swift
//  MartianTranslatorTests
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import XCTest
@testable import MartianTranslator

class MartianTranslatorTests: XCTestCase {
    
    var articleInteractor: ArticleInteractor?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        articleInteractor = ArticleInteractor()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        articleInteractor = nil
    }

    func testApostrophes() {
        let aposString = "Are your apostrophes different that mine? -> don't"
        let translatedString = articleInteractor?.fetchTranslated(text: aposString)
        let finalString = "Are boinga boinga boinga boinga boinga? -> boinga"
        XCTAssertTrue(translatedString == finalString)
    }
    
    func testCapitalLetters() {
        let capitalString = "This SHOULD work with Capital Letters...RIGHT?!"
        let translatedString = articleInteractor?.fetchTranslated(text: capitalString)
        let finalString = "Boinga BOINGA boinga boinga Boinga Boinga...BOINGA?!"
        XCTAssertTrue(translatedString == finalString)
    }
    
    func testAposAndCapital() {
        let aposAndCapitalString = "At this point, I'm out of test ideas HAHAHAHA"
        let translatedString = articleInteractor?.fetchTranslated(text: aposAndCapitalString)
        let finalString = "At boinga boinga, I'm out of boinga boinga BOINGA"
        XCTAssertTrue(translatedString == finalString)
    }
    
    // This one I wasn't sure, the number is within a character, technicaly that it is a word...I think. So 6M I think should be BOINGA because it only has capital letters and has a number in the word. Hope my thought process makes sense
    
    func testNumbers() {
        let numberString = "I got one! 2 x 3 is 6M, right? No, it's 6."
        let translatedString = articleInteractor?.fetchTranslated(text: numberString)
        let finalString = "I got one! 2 x 3 is BOINGA, boinga? No, it's 6."
        XCTAssertTrue(translatedString == finalString)
    }
    
    // The hardest part was punctuation. Puncuation took me awhile to think about because whenever I thought of the translation algorithm, I was always got stuck for special test cases such as eight-year-old or `Omes. I would think it would be boinga-boinga-old and `Boinga.
    func testSymbolsWithLetters() {
        let symbolString = "Man, Objective-C is something \"else\". [[UIView alloc] initWithFrame:self.view.frame];"
        let translatedString = articleInteractor?.fetchTranslated(text: symbolString)
        let finalString = "Man, Boinga-C is boinga \"boinga\". [[Boinga boinga] boinga:boinga.boinga.boinga];"
        XCTAssertTrue(translatedString == finalString)
    }

}
