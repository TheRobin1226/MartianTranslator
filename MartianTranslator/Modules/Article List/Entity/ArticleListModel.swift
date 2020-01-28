//
//  ArticleListModel.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/13/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import Foundation

struct ArticleListModel: Codable {
    let title: String
    let images: [Image]
    let body: String
}

struct Image: Codable {
    let top_image: Bool
    let url: String
    let width: Int
    let height: Int
}
