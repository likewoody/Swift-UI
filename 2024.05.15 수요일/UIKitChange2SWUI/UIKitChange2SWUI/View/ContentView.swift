//
//  ContentView.swift
//  UIKitChange2SWUI
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    // 추가 해야할 것
    // 검색
    // short press 시 수정하기
    // long press 시 상태 변경 하기
    // 문제
    // 클릭 시 왜 ForEach의 데이터는 왜 랜덤으로 움직이는가?
    // 아마 아이디가 없어서 그런 듯 하다
    // Identifiable로 아이디를 넣어줘도 그러네?
    
    @State var todoSearch: String = ""
    
    // Data DB에서 가져오면 된다.
    @State var todoList: [Todo] = [
        Todo(content: "집에가기", insertDate: ""),
        Todo(content: "밥먹기", insertDate: ""),
        Todo(content: "수업 듣기", insertDate: ""),
    ]
    // Data DB에서 가져와서 data 넣고 검색 하고 add 하면 됨
    
    @State var addButtonState = false
    @State var updateButtonState = false
    @State var updateLongButtonState = false
    @State var addTf: String = ""
    @State var updateTf: String = ""
    
    
    var body: some View {
        NavigationView(content: {
            VStack(content: {
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
                
                // List
                LazyVGrid(columns: Array(repeating: GridItem(), count: 1), spacing: 5, content: {
                    ForEach(todoList, content: { data in
                        HStack(content: {
                            Image(systemName: "sun.max")
                            Spacer()
                            
                            // List 클릭시 short, long press
                            Text(data.content)
                                .font(.title)
                                .foregroundStyle(.black)
                            
                            Spacer()
                        }) // HStack
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .scaledToFit()
                        .padding()
                        .border(.black)
                        .onTapGesture {
                            updateButtonState = true
                        }
                        .alert("수정", isPresented: $updateButtonState){
                            TextField(data.content, text: $updateTf)
                            // 추가와 취소의 버튼을 HStack으로 보여준다.
                            HStack(content: {
                                Button("수정", action: {
                                })
                                Button("취소", action: {})
                            })
                        } message: {
                            Text("수정 하고자 하는 데이터를 입력하세요.")
                        } // short press alert
                        .onLongPressGesture(minimumDuration: 0.3, perform: {
                            updateLongButtonState = true
                            print(updateLongButtonState)
                        })
                        .alert("상태 변경", isPresented: $updateLongButtonState){
                            VStack(content: {
                                Button("완료", action: {})
                                Button("미완료", action: {})
                                Button("취소", action: {})
                            })
                        } // long press alert
                        
                    }) // ForEach
                    .padding()
                    
                }) // LazyVGrid
                Spacer()
                
            }) // VStack
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            // toolbar에서 add Button State를 true로 먼저 만들고
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("", systemImage: "plus", action: {
                        addButtonState = true
                    })
                })
            })
            // alert가 실행된다
            .alert("데이터 추가", isPresented: $addButtonState){
                TextField("", text: $addTf)
                // 추가와 취소의 버튼을 HStack으로 보여준다.
                HStack(content: {
                    Button("추가", action: {
                        todoList.append(Todo(content: addTf, insertDate: ""))
                    })
                    Button("취소", action: {})
                })
            // alert의 message
            } message: {
                Text("추가할 메시지를 입력하세요.")
            }
            
                        
        }) // NavigationView
        
    } // body
    
} // ContentView

#Preview {
    ContentView()
}
