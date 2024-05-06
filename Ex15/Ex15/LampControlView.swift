//
//  LampControlView.swift
//  Ex15
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct LampControlView: View {
    
    
    @Binding var sharedState: Int
    @Binding var sharedOnOff: Bool
    @Binding var sharedRed: Bool
    
    @State var lampTxt = "Off"
    @State var lampRed = "Yellow"
//    @State var toggleRed = false
    
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Text(lampTxt)
                    .padding(10)
                Toggle("", isOn: $sharedOnOff)
                    .labelsHidden()
                    .onChange(of: sharedOnOff, {
                        clickOnOff()
                    })
            }) // HStack
            
            HStack(content: {
                Text(lampRed)
                    .padding(10)
                Toggle("", isOn: $sharedRed)
                    .labelsHidden()
                    .onChange(of: sharedRed, {
                        clickOnOff()
                    })
            }) // HStack
            
        }) // VStack
        .navigationTitle("전구선택 화면")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            
            switch sharedState{
            case 0 :
                lampTxt = "On"
                lampRed = "Yellow"
            case 1 :
                lampTxt = "Off"
                lampRed = "Yellow"
            default :
                lampTxt = sharedOnOff ? "On" : "Off" 
                lampRed = sharedRed ? "Red" : "Yellow"
                
            } // switch
            
        }) // onAppear
        
    } // body
    
    // --- functions ----
    func clickOnOff() {
        
        if sharedOnOff {
            if sharedRed {
                sharedState = 2
                lampRed = "Red"
                lampTxt = sharedOnOff ? "On" : "Off"
            } else {
                sharedState = sharedOnOff ? 0 : 1
                lampTxt = sharedOnOff ? "On" : "Off"
                lampRed = "Yellow"
            }

        } else {
            lampRed = sharedRed ? "Red" : "Yellow"
            lampTxt = "Off"
            sharedState = 1
        }
            
    } // func
    
} // ContentView

//#Preview {
//    LampControlView()
//}
