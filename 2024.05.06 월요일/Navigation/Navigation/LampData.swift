//
//  SecondView.swift
//  Navigation
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct SecondView: View {
    
    
    // 받아오는 데이터
    // Binding = 생성자 역할
    @Binding var sharedData: String
    @Binding var sharedLampState: String
    
    
    @FocusState var isTextFieldFocused: Bool
    
    @State var currentLampState = "On"
    @State var toggleState = true
    
    var body: some View {
        VStack {
            HStack(content: {
                Text("Message")
                    .frame(width: 100, alignment: .leading)
                    .scaledToFit()
                
                TextField("", text: $sharedData)
                    .frame(width: 180)
                    .textFieldStyle(.roundedBorder)
                    .scaledToFit()
                    .keyboardType(.default)
                    .focused($isTextFieldFocused)
                
            }) // HStack
            .padding(.bottom,15)
            
            
            HStack(spacing: 15, content: {
                
                Spacer()
                
                Text(currentLampState)
                
                Toggle("", isOn: $toggleState)
                    .labelsHidden()
                    .padding()
                    .onChange(of: toggleState, {
                        changedToggle()
                    }) // Toggle
                
            }) // HStack
            
        } // VStack
        .navigationTitle("Second View")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            
            if sharedLampState == "lamp_on" {
                toggleState = true
                currentLampState = "On"
            } else {
                toggleState = false
                currentLampState = "Off"
            }
        }) // onAppear
        
    } // body
    
    func changedToggle() {
        if toggleState{
            sharedLampState = "lamp_on"
            currentLampState = "On"
        } else {
            sharedLampState = "lamp_off"
            currentLampState = "Off"
        }
    }
    
} // ContentView

//#Preview {
//    SecondView(sharedData: .constant("aaa"), sharedLampState: .constant("lamp_on"))
//    
//}
