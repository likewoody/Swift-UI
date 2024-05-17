//
//  ContentView.swift
//  SQLiteSimpleTodoList
//
//  Created by Woody on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var todoList: [Todo] = []
    @State var isPresent: Bool = false
    @State var isAlert: Bool = false
    @State var content: String = ""
    @FocusState var isTextFieldFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {}
        .sheet(isPresented: $isPresent, content: {
            VStack{
                Text("추가할 내용을 입력하세요.")
                
                TextField("", text: $content)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .focused($isTextFieldFocused)
                Button("OK", action: {
                    let queryModel: DBModel = DBModel()
                    // return 사용 안하겠다.
                    _ = queryModel.insertDB(content: content)
                    isAlert = true
                    isPresent = false
                })
                
            }
        }) // ZStack (sheet)
        .alert("입력 완료", isPresented: $isAlert, actions: {
            Button("확인", action: {
                dismiss()
            })
        })
        .onChange(of: isAlert, {
            todoList.removeAll()
            content = ""
            isTextFieldFocused = false
            let queryModel: DBModel = DBModel()
            todoList = queryModel.queryDB()
            
        })
        
        NavigationView{
            List{
                ForEach(todoList, id:\.id, content: { todo in
                    HStack(content: {
                        Image(systemName: "house.circle")
                            .frame(width: 30, height: 30)
                        Text(todo.content)
                    })
                    .padding()
                }) // ForEach
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        let item = todoList[index]
                        let dbModel = DBModel()
                        _ = dbModel.deleteDB(id: Int(item.id))
                    }
                })
            } // List
            .onAppear(perform: {
                todoList.removeAll()
                let queryModel: DBModel = DBModel()
                todoList = queryModel.queryDB()
            })
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("", systemImage: "plus", action: {
                        isPresent = true
                        isAlert = false
                    })
                })
            })
        } // NV View
    } // body
} // ContentView

#Preview {
    ContentView()
}
