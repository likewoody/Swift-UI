//
//  ContentView.swift
//  SQLite
//
//  Created by Woody on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var studentList: [Students] = []
    
    var body: some View {
        
        NavigationView(content: {
            List(content: {
                ForEach(studentList, id: \.id, content: { student in
                    NavigationLink(destination: Detail(student: student, image: student.image), label: {
                        HStack {
                            Image(uiImage: student.image)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .scaledToFit()
                            VStack(content: {
                                Text("성명 : \(student.name)")
                                Text("학번 : \(student.id)")
                                    .font(.system(size: 14))
                            })
                        } // VStack
                    }) // Link
                })
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        let item = studentList[index]
                        let studentDB = StudentDB()
                        Task{
                            _ = await studentDB.deleteDB(id: Int(item.id)) // 받아서 사용은 안하겠다.
                        }
                        
                    }
                })
            })
            // **** onAppear 순서 틀리면 입력, 수정, 삭제 해도 화면에 바로 반영 안된다 ****
            .onAppear(perform: {
                // 초기화 시킨다. 그리고 받아온다.
                studentList.removeAll()
                let queryModel = StudentDB()
                studentList = queryModel.queryDB()
            }) // onAppear
            .navigationTitle("Main View")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: Add(), label: {
                        Image(systemName: "plus")
                    })
                })
            })
        }) // NavigationView

        
    } // body
} // ContentView

#Preview {
    ContentView()
}
