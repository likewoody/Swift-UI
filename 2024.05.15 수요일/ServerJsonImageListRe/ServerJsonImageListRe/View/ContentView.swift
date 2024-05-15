//
//  ContentView.swift
//  ServerJsonImageList
//
//  Created by Woody on 5/15/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var movieList: [JSONModel] = []
    
    var body: some View {
        NavigationView(content: {
            List(movieList, id: \.title, rowContent: {movie in
                NavigationLink(destination: Detail(movie: movie), label: {
                    HStack(content: {
                        WebImage(url: URL(string:movie.image))
                            .resizable()
                            .frame(width: 100, height: 140)
                        Text(movie.title)
                    }) // HSatck

                }) // Link
            }) // List
            .navigationTitle("영화 리스트")
        }) // NavigationView
        .onAppear(perform: {
            Task{
                let queryModel = QueryModel()
                movieList = try await queryModel.loadJsonData(url: URL(string: "https://zeushahn.github.io/Test/ios/movies.json")!)
            } // Task
            
        }) // onAppear
        
    } // body
    
} // ContentView

#Preview {
    ContentView()
}
