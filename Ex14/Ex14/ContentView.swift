//
//  ContentView.swift
//  Ex14
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var lampImg = ["lamp_on", "lamp_off", ""]
    @State var currentLampState = 1
    @State var currentText = "현재 On 상태입니다."
    
    @State var turnOnLamp = false
    @State var turnedOnLamp = false
    @State var turnOffLamp = false
    @State var turnedOffLamp = false
    @State var removeLamp = false
    @State var removeLamp2 = false

    
    var body: some View {
        VStack {
            Text("Alert")
                .font(.system(.title))
                .bold()
            
            Image(lampImg[currentLampState])
                .resizable()
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            HStack(spacing: 15, content: {
                Button("켜기", action: {
                    checkLampOn()
                })
                .alert("현재 On 상태 입니다.", isPresented: $turnedOnLamp, actions: {
                    Button("네, 알겠습니다.", role: .none, action: {
                        print("clicked aleary turned on the lamp")
                        turnedOnLamp = false
                    })
                }) // alert
                .alert("램프를 키시겠습니까?", isPresented: $turnOnLamp, actions: {
                    Button("네", role: .none, action: {
                        print("clicked turn on the lamp")
                        currentLampState = 0
                        turnOnLamp = false
                    })
                    Button("아니오", role: .none, action: {
                        print("clicked No")
                        turnOnLamp = false
                    })
                }) // alert
                
                Button("끄기", action: {
                    checkLampOff()
                })
                .alert("현재 Off 상태 입니다.", isPresented: $turnedOffLamp, actions: {
                    Button("네, 알겠습니다.", role: .none, action: {
                        print("clicked aleary turned on the lamp")
                        turnedOffLamp = false
                    })
                }) // alert
                .alert("램프를 끄시겠습니까?", isPresented: $turnOffLamp, actions: {
                    Button("네", role: .none, action: {
                        print("clicked turn on the lamp")
                        currentLampState = 1
                        turnOffLamp = false
                    })
                    Button("아니오", role: .none, action: {
                        print("clicked No")
                    })
                }) // alert
                
                
                Button("제거", action: {
                    removeLamp = true
                })
                .alert("램프를 제거할까요?", isPresented: $removeLamp, actions: {
                    Button("아니오, 끕니다", role: .none, action: {
                        print("clicked turn off the lamp")
                        
                        if currentLampState == 0 || currentLampState == 2{
                            currentLampState = 1
                            turnedOffLamp = false
                        } else {
                            checkLampOff()
                        }
                        
                    })
                    Button("아니오, 켭니다", role: .none, action: {
                        print("clicked turn on the lamp")
                        
                        if currentLampState == 1 || currentLampState == 2{
                            currentLampState = 0
                            turnedOnLamp = false
                        } else {
                            checkLampOn()
                        }
                        
                    })
                    Button("네, 제거합니다", role: .none, action: {
                        if currentLampState == 2 {
                            removeLamp2 = true
                            print("check remove 아이템")
                        } else {
                            print("clicked remove the lamp")
                            currentLampState = 2
                        }
                        
                    })
                    .alert("이미 제거된 상태입니다.", isPresented: $removeLamp2, actions: {
                        Button("네", role: .none, action: {
                            print("check")
                        })
                    })
                    
                }) // alert
                
            }) // HStack
            
        } // VStack
        .padding()
    } // body
    
    // ---- functions ----
    func checkLampOn(){
        if currentLampState == 0{
            turnedOnLamp = true
        } else {
            turnOnLamp = true
        }
    }
    
    func checkLampOff(){
        if currentLampState == 1{
            turnedOffLamp = true
        } else {
            turnOffLamp = true
        }
    }
    
} // ContenView

#Preview {
    ContentView()
}
