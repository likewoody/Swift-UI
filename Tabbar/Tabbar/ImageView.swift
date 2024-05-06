//
//  ContentView.swift
//  ImageView
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ImageView: View {
    
    // size 0 큰, 1 작은
    @State var lampWidth: [CGFloat] = [130.0, 320.0]
    @State var lampHeight: [CGFloat] = [200.0, 500.0]
    
    // image 0 켜진, 1번 꺼진
    @State var imageLamp: [String] = ["lamp_on", "lamp_off"]
    
    // ---------------------------
    // 초기 index
    @State var indexSwitch: Int = 0
    // true lamp_on, false lamp_off
    @State var stateZoom: Bool = false
    @State var stateSwitch: Bool = true
    // ---------------------------
    
    // button text
    @State var txtZoom: String = "전구 확대"
    @State var txtSwitch: String = "전구 스위치"
    
    
    var body: some View {
        VStack {
            Image(stateSwitch ? imageLamp[0] : imageLamp[1])
                // 화면 크기에 맞게끔 사이즈를 조정해준다.
                .resizable()
                // first frame 큰 프레임
                .frame(width: lampWidth[indexSwitch], height: lampHeight[indexSwitch])
                
                // 두개의 프레임을 쓰려면 fixedSize를 사용해야 한다.
                .fixedSize()
                // second frame 작은 프레임
                .frame(height: 400)
            
            
            HStack(content: {
                VStack(content: {
                    Text(txtZoom)
                    Toggle("", isOn: $stateZoom)
                        .labelsHidden()
                        // 여기에서는 $ 사용 안해도 된다.
                        .onChange(of: stateZoom, {
                            sizeZoom()
                        })
                })
                .padding(.trailing, 30)
        
                VStack(content: {
                    Text(txtSwitch)
                    // switch를 toggle이라고 한다.
                    Toggle("", isOn: $stateSwitch)
                        // 가운데 정렬?
                        .labelsHidden()
                })
//                Text(toggleStatus ? "켜짐" : "꺼짐")
                
                
            })
            .padding(.top, 100)
        }
        .padding()
        
    } // End body
    
    // ---- Fucntions ----
    func sizeZoom(){
        if stateZoom{
            txtZoom = "전구 축소"
            indexSwitch = 1
        } else {
            txtZoom = "전구 확대"
            indexSwitch = 0
        }
    }
    
} // End ContentView

#Preview {
    ImageView()
}
