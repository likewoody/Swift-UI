//
//  TodoList.swift
//  Quiz17
//
//  Created by Woody on 5/11/24.
//

import Foundation

// id hash 값 만들기
struct TodoList: Identifiable{
    var id = UUID()
    var item: String
    var itemImageFile: String
}
