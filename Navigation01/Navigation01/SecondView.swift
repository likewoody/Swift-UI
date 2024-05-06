//
//  SecondView.swift
//  Navigation01
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct SecondView: View {
    // Navigation에 선언한 클라스만 사용할 수 있음
    @EnvironmentObject var lampData : LampData
    @FocusState var isTextFieldFocused: Bool
    
    @State var toggleLabel = "On"
    @State var toggleState = true
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Text("Meesage")
                
                TextField("", text: $lampData.sharedData)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .padding(20)
                
            }) // HStack
            
            HStack(content: {
                
                Spacer()
                
                Text(toggleLabel)
                Toggle("", isOn: $toggleState)
                    .labelsHidden()
                    .padding()
                    .onChange(of: toggleState, {
                        if toggleState {
                            lampData.sharedLampStatus = "lamp_on"
                            toggleLabel = "On"
                        } else {
                            lampData.sharedLampStatus = "lamp_off"
                            toggleLabel = "Off"
                        }
                    }) // onChange
                    
            }) // HStack
            
        }) // VStack
        .onAppear(perform: {
            
            (toggleLabel, toggleState) = lampData.sharedLampStatus == "lamp_on" ? ("On", true) : ("Off", false)
            
        }) // onAppear
        
    } // body
    
} // SecondView

#Preview {
    SecondView().environmentObject(LampData())
}
