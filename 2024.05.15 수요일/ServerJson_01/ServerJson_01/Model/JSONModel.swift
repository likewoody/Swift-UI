//
//  JSONModel.swift
//  ServerJson_01
//
//  Created by Woody on 5/15/24.
//

import Foundation

// codable과 model을 한 곳에서 다 처리할 수 있다.
// Decodable
struct StudentJSON: Decodable{
    let code: String
    let phone: String
    let name: String
    let dept: String
}

// ForEach를 쓰기 위해선 id가 필요한데
// code가 key처럼 보이기 때문에 code를 key값으로 만들기
extension StudentJSON: Hashable{
    func hash(into hasher: inout Hasher) {
        // hasher는 key값을 만들어주는 친구
        // combine : value to the key
        hasher.combine(code)
    }
}
