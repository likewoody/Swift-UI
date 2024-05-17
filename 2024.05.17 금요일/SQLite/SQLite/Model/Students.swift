//
//  Students.swift
//  SQLite
//
//  Created by Woody on 5/17/24.
//

import Foundation

struct Students{
    var id: Int
    var name: String
    var dept: String
    var phone: String
    
    init(id: Int, name: String, dept: String, phone: String) {
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
}

// 이렇게 설정해야지 ForEach의 id를 this.id 로 사용할 수 있음
extension Students: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
