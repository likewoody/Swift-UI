//
//  ContentView.swift
//  UIKitChange2SWUI
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    // 추가 해야할 것
    // MySQL Delete를 어떻게 이용할 것인가?
    // 그리고 rearrange를 어떻게 할 것인가?
    
    @State var todoSearch: String = ""
    @State var todoList: [Todo] = [
        Todo(id: "1", content: "123123123", insertdate: "", willMoveId: "1", todoCompletion: ""),
        Todo(id: "2", content: "test", insertdate: "", willMoveId: "2", todoCompletion: ""),
        Todo(id: "3", content: "afdr55", insertdate: "", willMoveId: "3", todoCompletion: ""),
        Todo(id: "4", content: "테스트", insertdate: "", willMoveId: "4", todoCompletion: ""),
    ]
//    @State var todoList: [Todo] = []
    // 클릭 했을 시 상태 체크를 통해 alert 열기 위함
    @State var addButtonState = false
    // short press state 관리
    @State var shortPressState = false
    // long press state 관리
    @State var longPressState = false
    // 업데이트 완료 alert
    @State var updateCompleteAlert = false
    @State var completionCheck = false
    @State var addContent: String = ""
    // update할 content
    @State var updateContent: String = ""
    // 현재 아이디를 알아야 update가 가능
    @State var currentIdCheck: String = ""
    @State var currentCompletionCheck: String = ""
//    @State var draggedTodo: Todo?
    
    
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
                        print("get")
                        Task{
                            let queryModel = SearchQuery()
                            todoList = try await queryModel.loadData(url: URL(string: "http://localhost:8080/iOS/JSP/TodoSearchContent.jsp?content=\(todoSearch)")!)
                        }
                        
                    }) // Button
                }) // HStack
                .padding(15)
                
                // List
                List{
                    ForEach(todoList, id: \.self, content: { todo in
                        HStack(content: {
                            Image(systemName: "sun.max")
                            Spacer()
    
                            // List 클릭시 short, long press
                            Text(todo.content)
                                .font(.title)
                                .foregroundStyle(.black)
                                .padding()
    
                            Spacer()
                        })
                        .opacity(todo.todoCompletion == "1" ? 0.5 : 1.0) // 투명도
                        .foregroundColor(todo.todoCompletion == "1" ? .gray : .black) // 글자 색깔
                        .onTapGesture{
                            updateContent = todo.content
                            currentIdCheck = todo.id
                            currentCompletionCheck = todo.todoCompletion
                        } // short Press
                        .onLongPressGesture(minimumDuration: 0.3, perform: {
                            currentIdCheck = todo.id
                            longPressState = true
                        }) // long Press
//                        .onDrag({
//                            self.draggedTodo = todo
//                            return NSItemProvider()
//                        })
//                        
//                        .onDrop(of: [.text], delegate: DropViewDelegate(destinationTodo: todo, todos: $todoList, draggedTodo:$draggedTodo))
                    })
                    .onDelete(perform: { indexSet in
                        // Delete Action 넣어야함
                        todoList.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: moveList)
                    
                }
                
                // 우측에 editMode icon 만들기 Move 쓸 때만
//                .environment(\.editMode, .constant(.active))
//                List(todoList, id: \.id, rowContent: { todo in
//                    
//                    HStack(content: {
//                        Image(systemName: "sun.max")
//                        Spacer()
//                        
//                        // List 클릭시 short, long press
//                        Text(todo.content)
//                            .font(.title)
//                            .foregroundStyle(.black)
//                            .padding()
//                                                
//                        Spacer()
//                    })
//                    .opacity(todo.todoCompletion == "1" ? 0.5 : 1.0) // 투명도
//                    .foregroundColor(todo.todoCompletion == "1" ? .gray : .black) // 글자 색깔
//                    .onTapGesture{
//                        updateContent = todo.content
//                        currentId = todo.id
//                        currentCompletion = todo.todoCompletion
//                    } // short Press
//                    .onLongPressGesture(minimumDuration: 0.3, perform: {
//                        currentId = todo.id
//                        longPressState = true
//                    }) // long Press
//                }) // List
                Spacer()
                
            }) // VStack
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { EditButton() } // 이걸 사용하면 delete, reorder 둘 다 사용 가능
            // toolbar에서 add Button State를 true로 먼저 만들고
            
//            .toolbar(content: {
//                ToolbarItem(placement: .topBarTrailing, content: {
//                    Button("", systemImage: "plus", action: {
//                        addButtonState = true
//                    })
//                })
//            })
            .alert("추가", isPresented: $addButtonState){
                TextField("목록 입력", text: $addContent)
                // 추가와 취소의 버튼을 HStack으로 보여준다.
                HStack(content: {
                    Button("추가", action: {
                        Task{
                            let queryModel = UpdateQuery()
                            let result = try await queryModel.updateData(url: URL(string: "http://localhost:8080/iOS/JSP/TodoInsert.jsp?content=\(addContent)")!)
                            
                            if result {
                                initData()
                            }
                        } // Task
                    })
                    Button("취소", action: {})
                })
            } // Show Insert Alert
            .onTapGesture {
                if currentCompletionCheck == "0" {
                    shortPressState = true
                }
            }
            .alert("수정", isPresented: $shortPressState){
                TextField("", text: $updateContent)
                // 추가와 취소의 버튼을 HStack으로 보여준다.
                HStack(content: {
                    Button("수정", action: {
                        Task{
                            let queryModel = UpdateQuery()
                            let result = try await queryModel.updateData(url: URL(string: "http://localhost:8080/iOS/JSP/TodoUpdate.jsp?id=\(currentIdCheck)&content=\(updateContent)")!)
                            print(result)
                            if result {
                                updateCompleteAlert = true
                            }
                        } // Task
                    })
                    Button("취소", action: {})
                })
            } // Show Update Alert
            .alert("알림", isPresented: $updateCompleteAlert){
                VStack(content: {
//                    let progress = Progress()
                    Text("수정이 완료 되었습니다.")
                        .font(.headline)
                    
                    Button("확인", action: {
//                        progress.becomeCurrent(withPendingUnitCount: 1)
                        initData()
//                        progress.completedUnitCount += 1
                    })
//                    ProgressView(progress)
                })
            } // Update Completed Alert
            .alert("상태 변경", isPresented: $longPressState){
                VStack(content: {
                    Button("완료", action: {
                        Task{
                            await completionChange(intCompletion: 1)
                        }
                    })
                    Button("미완료", action: {
                        Task{
                            await completionChange(intCompletion: 0)
                        }
                        
                    })
                    Button("취소", action: {})
                })
            } // long press alert
                        
        }) // NavigationView
        
        .onAppear(perform: {
            UITableView.appearance().isEditing = true
            initData()
        })// init
        
    } // body
    
    func moveList(from source: IndexSet, to destination: Int) {
        todoList.move(fromOffsets: source, toOffset: destination)
    }
    
    // init, update, insert 등을 실행할 때 사용하기 위해 func
    func initData(){
        Task{
            let queryModel = SearchQuery()
            todoList = try await queryModel.loadData(url: URL(string: "http://localhost:8080/iOS/JSP/TodoSearch.jsp")!)
        }
    }
    
    // 0 미완료, 1 완료
    func completionChange(intCompletion: Int) async{
        Task{
            let queryModel = UpdateCompletion()
            let result = try await queryModel.updateData(url: URL(string: "http://localhost:8080/iOS/JSP/TodoUpdateCompletion.jsp?completion=\(intCompletion)&id=\(currentIdCheck)")!)
            initData()
        }
    }
    
} // ContentView

//struct DropViewDelegate: DropDelegate{
//    
//    let destinationTodo : Todo
//    @Binding var todos: [Todo]
//    @Binding var draggedTodo : Todo?
//
//    
//    // move 그리고 drop이 되었다면
//    func dropUpdated(info: DropInfo) -> DropProposal? {
//        return DropProposal(operation: .move)
//    }
//    
//    // drop 할 경우, drag 했던 todo 들을 초기화 시킨다.
////    func performDrop(info: DropInfo) -> Bool {
////        draggedTodo = nil
////        return true
////    }
//    func performDrop(info: DropInfo) -> Bool {
//        if let draggedTodo = draggedTodo, let fromIndex = todos.firstIndex(of: draggedTodo), let toIndex = todos.firstIndex(of: destinationTodo) {
//            self.todos.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
//        }
//        self.draggedTodo = nil
//        return true
//    }
    
    // drag한 todo를 todo들 사이에 넣으려고 하는 연산식
//    func dropEntered(info: DropInfo) {
//        if let draggedTodo {
//            let fromIndex = todos.firstIndex(of: draggedTodo)
//            if let fromIndex {
//                let toIndex = todos.firstIndex(of: destinationTodo)
//                if let toIndex, fromIndex != toIndex {
//                    withAnimation(.default) {
//                        self.todos.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
//                    }
//                }
//            }
//        }
//    }
//}

#Preview {
    ContentView()
}
