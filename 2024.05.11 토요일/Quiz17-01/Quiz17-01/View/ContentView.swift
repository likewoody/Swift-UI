//
//  ContentView.swift
//  Quiz17-01
//
//  Created by Woody on 5/11/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var animalList: [Animal] = [
        Animal(name: "벌", image: "bee", type: "곤충", fly: "있"),
        Animal(name: "강아지", image: "dog", type: "포유류", fly: "없"),
        Animal(name: "소", image: "cow", type: "포유류", fly: "없"),
        Animal(name: "고양이", image: "cat", type: "포유류", fly: "없"),
        Animal(name: "여우", image: "fox", type: "포유류", fly: "없"),
        Animal(name: "돼지", image: "pig", type: "포유류", fly: "없"),
    ]
    
    @State var alert = false
    
    var body: some View {
        NavigationView(content: {
            List(content: {
                ForEach(animalList, content: { animal in
                    NavigationLink(destination: DetailView(animal: animal), label: {
                        ListView(animal: animal)
                    }) // NavigationLink
                    
                }) // ForEach
                .onDelete(perform: { indexSet in
                    animalList.remove(atOffsets: indexSet)
                    alert = true
                }) // onDelete
                .alert(isPresented: $alert) {
                    Alert(title: Text("알림"), message: Text("삭제가 되었습니다."), dismissButton: .default(Text("확인")))
                } // alert
                
            }) // List
            
        }) // NavigationView
        
    } // body
    
} // content

struct ListView: View{
    
    var animal: Animal
    
    var body: some View {
        HStack(content: {
            Image(animal.image)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
            
            Text(animal.name)
        }) // HStack
        
    } // body
    
} // ListView

#Preview {
    ContentView()
}
