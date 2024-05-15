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
            ScrollView(content: {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                    ForEach(movieList, id: \.title,content: { movie in
                        NavigationLink(destination: Detail(movie: movie), label: {
                            WebImage(url: URL(string:movie.image))
                                .resizable()
                                .frame(width: 120, height: 140)
                                .clipShape(.rect(cornerRadius: 10))
                        }) // Link
                        
                    }) // ForEach
                    
                }) // LazyVGrid
                
            }) // ScrollView
            
            .navigationTitle("영화 리스트")
            .navigationBarTitleDisplayMode(.inline)
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
