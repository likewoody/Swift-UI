//
//  Students.swift
//  SQLite
//
//  Created by Woody on 5/17/24.
//

// UIImage는 SwiftUI 필요하다
import SwiftUI

struct Students{
    var id: Int
    var name: String
    var dept: String
    var phone: String
    var image: UIImage
    
    init(id: Int, name: String, dept: String, phone: String, image: UIImage) {
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
        self.image = image
    }
}

// 이렇게 설정해야지 ForEach의 id를 this.id 로 사용할 수 있음
extension Students: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
