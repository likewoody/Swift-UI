//
//  ContentView.swift
//  CollectionView_Label
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    // 데이터 준비
    @State var dataArray: [String] = [
    "유비", "관우", "장비", "조조", "여포", "동탁", "초선", "손견"
    ]
    
    var body: some View {
        NavigationView(content: {
            // ScrollView default Vertical, horizontal로 주려면 넣어주어야 한다.
            ScrollView(.horizontal, content: {
                // Array(repeating: GridItem(), count: 3) GridView로 1 row 몇개의 item? count 3
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 100))], spacing: 10, content: {
                    
                    // List, Grid는 무조건 ForEach로 반복해서 데이터를 보여진다.
                    HStack(spacing: 10, content: {
                        
                        ForEach(dataArray, id: \.self, content: { data in
                            NavigationLink(destination: Detail(name: data)) {
                                Text(data)
                                    .frame(minWidth: 80, maxWidth: .infinity, minHeight: 120)
                                    .background(.blue)
                                    .foregroundStyle(.white)
                            } // Link
                            
                        })  // ForEach
                        
                    }) // HStack
                    
                }) // LazyVGrid
                .padding()
                
            }) // ScrollView
            .navigationTitle("삼국지 인물")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: Add(dataArrays: $dataArray), label: {
                        Image(systemName: "plus")
                    }) // Link
                }) // Item
            }) // toolbar
        }) // NavigationView
        
    } // body
    
} // ContentView

#Preview {
    ContentView()
}
