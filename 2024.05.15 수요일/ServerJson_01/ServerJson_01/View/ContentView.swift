//
//  ContentView.swift
//  ServerJson_01
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {

    // Url로부터 JSON을 받아온다.
    @State var students: [StudentJSON] = []
    
    var body: some View {
        NavigationView(content: {
            // model에서 만든 id: code
            List(students, id: \.code, rowContent: { student in
                VStack(alignment: .leading, content: {
                    Text("성명 : \(student.name)")
                    Text("학번 : \(student.code)")
                        .font(.system(size: 14))
                }) // VStack
                
                
            }) // List
            .navigationTitle("Students")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }) // NavigationView
        .onAppear(perform: {
            Task{
                students = try await loadData(url: URL(string: "https://zeushahn.github.io/Test/ios/student.json")!)
            }
        })
        
    } // body
    
    // ---- Functions ----
    // throws -> StudentJSON 타입으로 가져와
    func loadData(url: URL) async throws -> [StudentJSON]{
        // singleton 이란 무엇인가?
        // URLSession을 통해서 data, error 2가지가 들어올 것이다.
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([StudentJSON].self, from: data)
    }
    
    
} // ContentView

#Preview {
    ContentView()
}
