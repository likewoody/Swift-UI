//
//  Todo.swift
//  UIKitChange2SWUI
//
//  Created by Woody on 5/15/24.
//

import Foundation

struct Todo: Codable{
    var id: String
    var content: String
    var insertdate: String
    var willMoveId: String
    var todoCompletion: String

    init(id: String, content: String, insertdate: String, willMoveId: String, todoCompletion: String) {
        self.id = id
        self.content = content
        self.insertdate = insertdate
        self.willMoveId = willMoveId
        self.todoCompletion = todoCompletion
    }
}

extension Todo: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
