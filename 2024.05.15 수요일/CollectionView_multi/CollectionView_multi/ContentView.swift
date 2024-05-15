//
//  ContentView.swift
//  CollectionView_multi
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    var animalList: [Animal] = [
        Animal(img: "bee", name: "벌", type: "곤충", fly: "있"),
        Animal(img: "cat", name: "고양이", type: "포유류", fly: "없"),
        Animal(img: "cow", name: "소", type: "포유류", fly: "없"),
        Animal(img: "dog", name: "강아지", type: "포유류", fly: "없"),
        Animal(img: "fox", name: "여우", type: "포유류", fly: "없"),
        Animal(img: "monkey", name: "원숭이", type: "영장류", fly: "없"),
        Animal(img: "pig", name: "돼지", type: "포유류", fly: "없"),
        Animal(img: "wolf", name: "늑대", type: "포유류", fly: "없")
    ]
    
    
    var body: some View {
        NavigationView(content: {
            ScrollView(content: {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                    ForEach(animalList, content: { animal in
                        VStack(content: {
                            Image(animal.img)
                                .resizable()
                                .frame(maxWidth: 100, maxHeight: 150)
                            NavigationLink(destination: Detail(animal: animal), label: {
                                    Text(animal.name)
                                        .foregroundStyle(.black)
                            })

//                            Button(action: {
//                                
//                            }, label: {

//                            })
                            
                        }) // VStack
                    }) // ForEach
                }) // LazyVGrid
            }) // ScrollView
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }) // NavigationView
    } // body
} // ContentView

#Preview {
    ContentView()
}
