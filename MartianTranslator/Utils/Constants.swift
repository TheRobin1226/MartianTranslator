//
//  Constants.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/30/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct customColors {
        static let americanViolet = UIColor(red: 85.0/255.0, green: 32.0/255.0, blue: 132/255.0, alpha: 1.0)
        static let gold = UIColor(red: 255.0/255.0, green: 215.0/255.0, blue: 0/255.0, alpha: 1.0)
    }
    
    struct charSets {
        static let charSetPlusApostrophe = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'")
        static let charSet = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        static let upperCaseSet = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    }
    
    struct boingaVariations {
        static let upperCaseBoinga = "BOINGA"
        static let firstLetterUpperCaseBoinga = "Boinga"
        static let lowerCaseboinga = "boinga"
    }
}
