//
//  ContentView.swift
//  Navigation
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    // 공용 데이터
    @State var sharedData: String = ""
    @State var sharedLampState = "lamp_on"
    
    var body: some View {
        
        NavigationStack{
            VStack(content: {
                
                Spacer()
                
                Image(sharedLampState)
                    .resizable()
                    .frame(width: 150, height: 350)
                    .scaledToFit()
                    .padding(.bottom,80)
                
                
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
                    
                    // label은 button 글자
                    // Binding으로 결합되어 계속 자동 업데이트 되기에 갔다 와도 아무 변화를 주지 않아도 괜찮다.
                    NavigationLink(destination: SecondView(sharedData: $sharedData, sharedLampState: $sharedLampState), label: {
                        Text("수정")
                    })
                    .padding(.leading, 10)

                }) // HStack`
                
                Spacer()
                
            }) // VStack
            .navigationTitle("Main View") // title
            .navigationBarTitleDisplayMode(.inline)
            
            
        } // NavigationStack
        
    } // body
} // ContentView

#Preview {
    ContentView()
}
