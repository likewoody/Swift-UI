//
//  Detail.swift
//  Table
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct Detail: View {
    
    var todoList: TodoList
    
    var body: some View {
        VStack(content: {
            
            Image(todoList.images)
                .resizable()
                .frame(width: 150, height: 300)
                .scaledToFit()
            
            Text(todoList.items)
        }) // VStack
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
        
    } // body
    
} // Detail

//#Preview {
//    Detail(todoList: TodoList(images: "flower_03", items: "aaa"))
//}
