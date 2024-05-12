//
//  ContentView.swift
//  Quiz17
//
//  Created by Woody on 5/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoList: [TodoList] = [
        TodoList(item: "책 구매", itemImageFile: "play"),
        TodoList(item: "철수와 약속", itemImageFile: "pause"),
        TodoList(item: "집 일찍 가기", itemImageFile: "stop"),
    ]
    
    var body: some View {
        NavigationView(content: {
            List(content: {
                ForEach(todoList, content: {todo in
                    NavigationLink(destination: DetailView(todoList: todo), label: {
                        // struct로 List의 data View 분리
                        BasicImageRow(todoList: todo)
                    })
                    
                    
                })
                
            })
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            // plus button toolbar 만들기
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: AddView(todoLists: $todoList), label: {
                        Image(systemName: "plus.circle")
                    })
                })
            })
            
        })
        
    } // body
    
} // ContentView

#Preview {
    ContentView()
}


// struct로 분리해 List View 구성하기
struct BasicImageRow: View{
    
    // 하나씩 받아오기 때문에 []가 아닌 just 제네릭 모델
    var todoList: TodoList
    
    var body: some View{
        // 화면 구성
        HStack(content: {
            Image(todoList.itemImageFile)
                .resizable()
                .frame(width: 30, height: 40)
                .scaledToFit()
            
            Text(todoList.item)
        })
    }
    
}
