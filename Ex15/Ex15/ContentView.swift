//
//  ContentView.swift
//  Ex15
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentLamp = ["lamp_on","lamp_off","lamp_red",]
    @State var sharedState = 0
    @State var sharedOnOff = true
    @State var sharedRed = false
    
    
    var body: some View {
        
        // NavigationView와 Stack 크게 다르지 않음
        NavigationView(content: {
            VStack(content: {
                Image(currentLamp[sharedState])
                    .resizable()
                    .frame(width: 200, height: 400)
                    .scaledToFit()
                
            }) // VStack
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            // toolbar의 역할 -> button을 통한 page 이동
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: LampControlView(sharedState: $sharedState, sharedOnOff: $sharedOnOff, sharedRed: $sharedRed), label: {Image(systemName: "lightbulb.led")})
                })
            }) // toolbar
            
        }) // NavigationView
        
    } // body
} // ContentView

#Preview {
    ContentView()
}
