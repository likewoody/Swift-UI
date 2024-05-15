//
//  ContentView.swift
//  ServerJson_02
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var students: [StudentJSON] = []
    
    
    var body: some View {
        NavigationView(content: {
            List(students, id: \.code, rowContent: { student in
                VStack(content: {
                    Spacer()
                    HStack(content: {
                        Text("성명 : \(student.name)")
                            .padding(.leading, 15)
                        Text("전공 : \(student.dept)")
                            .padding(.leading, 15)
                        Spacer()
                    })
                    
                    HStack(content: {
                        Text("학번 : \(student.code)")
                            .padding(.leading, 15)

                        Text("전화번호 : \(student.phone)")
                            .padding(.leading, 15)
                        Spacer()
                    })
                    Spacer()
                }) // VStack
                
            }) // List
            .navigationTitle("Students")
            .onAppear(perform: {
                
                let queryModel = QueryModel()
                
                Task{
                    students = try await queryModel.getJsonData(url: URL(string: "https://zeushahn.github.io/Test/ios/student.json")!)
                }
            })
        }) // NavigationView
        
    } // body
    
    
} // ContentView

#Preview {
    ContentView()
}
