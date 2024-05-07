//
//  TodoList.swift
//  SimpleTodoList
//
//  Created by Woody on 5/6/24.
//

import Foundation

// id 값을 자동으로 만들어주는 Identifiable
struct TodoList: Identifiable {
    var id = UUID() // Unique Identifier
    var items: String
}
