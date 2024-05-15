//
//  ContentView.swift
//  CollectionView_image
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    var imgList: [String] = [
        "flower_01", "flower_02", "flower_03", "flower_04", "flower_05", "flower_06"
    ]
    
    var body: some View {
        NavigationView(content: {
            ScrollView(content: {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                    ForEach(imgList, id: \.self, content: { img in
                        NavigationLink(destination: Detail(img: img), label: {
                            Image(img)
                                .resizable()
                                .frame(maxWidth: 150, maxHeight: 200)
                                .clipShape(.rect(cornerRadius: 10))
                        }) // Link
                        
                    }) // ForEach
                    
                }) // Grid
                .padding()
            }) // ScrollView
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            
        }) // NavigationView
        
    } // body
    
} // ContentView

#Preview {
    ContentView()
}
