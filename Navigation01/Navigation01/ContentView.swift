//
//  ContentView.swift
//  Navigation01
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    // Navigation에 선언한 클라스만 사용할 수 있음
    @EnvironmentObject var lampData : LampData
    @FocusState var isTextFieldFocused : Bool
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Image(lampData.sharedLampStatus)
                    .resizable()
                    .frame(width: 120, height: 300)
                .scaledToFit()
                .padding()
                
                HStack(content: {
                    Text("Meesage")
                    
                    TextField("", text: $lampData.sharedData)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                        .padding(20)
                    
                    NavigationLink(destination: SecondView(), label: {
                        Text("수정")
                    }) // NavigationLink
                    
                }) // HStack
                
            } // VStack
            
        } // NavigationStack
        
    } // body
    
} // ContentView

#Preview {
    ContentView().environmentObject(LampData())
}
