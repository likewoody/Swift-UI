//
//  ContentView.swift
//  SimpleTodoList
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    // 초기 데이터
    @State var todoLists : [TodoList] = [TodoList(items: "꽃 선물 준비")]
    // bottom sheet 처음에 화면에 안보여야 하기 때문에 false
    @State var isAlert: Bool = false
    @State var userInput: String = ""
    
    var body: some View {
            
        NavigationView(content: {
            
            List(content: { // ListView
                ForEach(todoLists, content: { data in
                    BasicImageRow(todoList: data)
                }) // ForEach
                .onDelete(perform: { indexSet in
                    deleteItem(at: indexSet)
                }) // onDelete
                
            }) // List
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                // add ToolbarItem
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "plus")
                        .onTapGesture(perform: { // image를 button으로 만들기
                            isAlert.toggle() // true -> false, false -> true로 만들어준다.
                        }) // onTapGesutre
                        .sheet(isPresented: $isAlert, content: {
                            VStack(content: {
                                Text("추가할 내용을 입력 하세요")
                                    .bold()
                                    .font(.system(size: 20))
                                
                                TextField("내용", text: $userInput)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 200)
                                
                                Button("추가", action: {
                                    isAlert.toggle()
                                    
                                    if !userInput.isEmpty {
                                        todoLists.append(TodoList(items: userInput))
                                    }
                                    
                                    userInput.removeAll()
                                    
                                }) // Button
                                
                            }) // VStack
                            
                        }) // sheet
                    
                }) // ToolbarItem
                
            }) // toolbar
            
        }) // NavigationView
        
    } // body
    
    // ---- Functions ----
    func deleteItem(at offsets: IndexSet){
        // atOffsets 사용
        todoLists.remove(atOffsets: offsets)
    }
    
} // ContentView

struct BasicImageRow: View {
    
    // List에 내용을 담기 위한 인자 생성
    var todoList: TodoList
    
    var body: some View {
        HStack(content: {
            Image(systemName: "house.circle")
                .font(.system(size: 50))
            
            Text(todoList.items)
        }) // HStack
        
    } // body
    
} // BasicImageRow


#Preview {
    ContentView()
}
