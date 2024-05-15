//
//  ContentView.swift
//  ServerImage
//
//  Created by Woody on 5/15/24.
//

import SwiftUI
// ********* 추가 *********
import SDWebImageSwiftUI
// ********* 추가 *********

struct ContentView: View {
    
    let imageURL = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
    
    @State var checkCick: Bool = false
    @State var isButtonClicked: Bool = false
    
    var body: some View {
        VStack(content: {
            Button("Load Image", action: {
                isButtonClicked.toggle()
            })
            .padding()
            
            Spacer()
            
            if isButtonClicked{
                WebImage(url: imageURL)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(.rect)
                    .shadow(radius: 15)
            }
            
            Spacer()
        })
    }
}

#Preview {
    ContentView()
}
