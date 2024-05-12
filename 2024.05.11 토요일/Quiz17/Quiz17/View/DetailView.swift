//
//  DetailView.swift
//  Quiz17
//
//  Created by Woody on 5/11/24.
//

import SwiftUI

struct DetailView: View {
    
    var todoList: TodoList
    
    var body: some View {
        VStack(content: {
            
            Image(todoList.itemImageFile)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
            
            Text(todoList.item)
        })
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

//#Preview {
//    DetailView(todoList: TodoList(item: "aaa", itemImageFile: "pause"))
//}
