//
//  Todo.swift
//  MySQLSimpleTodoList
//
//  Created by Woody on 5/18/24.
//

struct Todo:Decodable{
    var id: String
    var content: String
    
    init(id: String, content: String) {
        self.id = id
        self.content = content
    }
}

extension Todo: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


