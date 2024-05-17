//
//  Todo.swift
//  SQLiteSimpleTodoList
//
//  Created by Woody on 5/17/24.
//

struct Todo{
    var id: Int
    var content: String
    
    init(id: Int, content: String) {
        self.id = id
        self.content = content
    }
}

extension Todo: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
