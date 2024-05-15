//
//  Student.swift
//  ServerJson_02
//
//  Created by Woody on 5/15/24.
//

import Foundation

struct StudentJSON: Decodable{
    var code: String
    var name: String
    var phone: String
    var dept: String
}

extension StudentJSON: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
}
