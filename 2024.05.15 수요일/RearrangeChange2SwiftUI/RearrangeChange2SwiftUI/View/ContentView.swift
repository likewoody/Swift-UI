//
//  ContentView.swift
//  RearrangeChange2SwiftUI
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    // 해야 할 것
    // // DB 연결하여 press 하여 순서 변경하기
    
    
    @State var todoList: [Todo] = [
        Todo(content: "test1", insertDate: ""),
        Todo(content: "test2", insertDate: ""),
        Todo(content: "test3", insertDate: ""),
    ]
    @State var todoSearch: String = ""
    @State var addButtonState: Bool = false
    
    var body: some View {
        NavigationView(content: {
            VStack {
                HStack(content: {
                    // 검색 Text Field
                    TextField("", text: $todoSearch)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .padding()
                    // 검색 Button
                    Button("", systemImage: "magnifyingglass", action: {
                        
                    }) // Button
                }) // HStack
                .padding(15)
                
                ScrollView(content: {
                    // List
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 1), spacing: 5, content: {
                        ForEach(todoList, content: { data in
                            HStack(content: {
                                Image(systemName: "sun.max")
                                Spacer()
                                
                                // List 클릭시 short, long press
                                Button(action: {
                                }, label: {
                                    Text(data.content)
                                        .font(.title)
                                        .foregroundStyle(.black)
                                }) // Button
                                
                                Spacer()
                            }) // HStack
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .scaledToFit()
                            .padding()
                            .border(.black)
                            .onDrag({
                                let data = NSItemProvider(object: data.content as NSString)
                                return data

                            })
                        }) // ForEach
                        .padding()
                        
                    }) // LazyVGrid
                }) // ScrollView

            }
            .navigationTitle("Todo List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("", systemImage: "plus", action: {
                        addButtonState = true
                    })
                })
            })
                        
        }) // NavigationView
        
    } // body
    
} // ContentView


//class DropViewDelegate: DropDelegate {
//    @Binding var todoList: [Todo]
//    let data: Todo
//    
//    init(todoList: Binding<[Todo]>, data: Todo) {
//        self._todoList = todoList
//        self.data = data
//    }
//    
//    func dropUpdated(info: DropInfo) -> DropProposal? {
//        return DropProposal(operation: .move)
//    }
//    
//    func performDrop(info: DropInfo) -> Bool {
//        let fromIndex = todoList.firstIndex { $0.id == data.id } ?? 0
//        let toIndex = info.insertionIndex
//
//        if fromIndex != toIndex {
//            todoList.move(fromOffsets: IndexSet(integer: fromIndex),
//                          toOffset: toIndex > fromIndex ? toIndex - 1 : toIndex)
//        }
//        
//        return true
//    }
//}
#Preview {
    ContentView()
}
