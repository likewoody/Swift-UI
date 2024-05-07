//
//  ContentView.swift
//  Table
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoList: [TodoList] = []
    
    var body: some View {
        NavigationView(content: {
            List(content: {
                ForEach(todoList, content: { data in
                    HStack(content: {
                        Image(data.images)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .padding(.trailing, 15)
                        Text(data.items)
                        
                        Spacer()
                        
                        NavigationLink(destination: Detail(todoList: data), label: {})
                        
                    }) // HStack
                    
                }) // ForEach
                .onDelete(perform: { indexSet in
                    deleteItem(indexSet)
                })
                
            }) // List
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    // AddView Page에 현재 todoList를 가져가서 append를 해주어야 하기 때문에 todoList를 보내준다.
                    NavigationLink(destination: AddView(todoLists: $todoList), label: {
                        Image(systemName: "plus")
                    })
                }) // ToolbarItem
                
            }) // toolbar
            
            
        }) // NavigationView
        .onAppear(perform: {
            initData()
        }) // onAppear
        
    } // body
    
    func initData() {
        todoList.append(TodoList(images: "flower_01", items: "책 구매"))
        todoList.append(TodoList(images: "flower_02", items: "철수와 앿곡"))
        todoList.append(TodoList(images: "flower_03", items: "스터디 준비하기"))
    }
    
    func deleteItem(_ index: IndexSet) {
        todoList.remove(atOffsets: index)
    }
    
} // ContentView

#Preview {
    ContentView()
}
