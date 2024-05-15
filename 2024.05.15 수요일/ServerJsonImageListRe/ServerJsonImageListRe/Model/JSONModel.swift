//
//  JSONModel.swift
//  ServerJsonImageList
//
//  Created by Woody on 5/15/24.
//

import Foundation

struct JSONModel: Decodable{
    var image: String
    var title: String
}

extension JSONModel: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
