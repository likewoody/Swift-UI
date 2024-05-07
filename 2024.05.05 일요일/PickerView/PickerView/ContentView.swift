//
//  ContentView.swift
//  PickerView
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var imgFileName: [String] = ["cat","bee","dog","wolf","pig","cow","fox","monkey"]
    @State var selectedImg: Int = 0
    
    var body: some View {
        VStack {
            Text("Picker로 이미지 선택")
                .bold()
                .font(.system(size: 30))
            // Text
            
            
            // selection 선택 됬을 때의 값
            Picker("", selection: $selectedImg, content: {
                // data : 범위
                // id : 따로 설정할 id가 없을 때 \.self 사용
                ForEach(0..<imgFileName.count, id: \.self, content: { index in
                    // closure문
                    // Data를 만드는 친구
//                    Text("\(imgFileName[index])")
                    // text 대신 이미지 넣기
                    Image(imgFileName[index])
                        .resizable()
                        .frame(width: 50)
                        .scaledToFit()
                    
                }) // ForEach
                
            }) // Picker
             .labelsHidden()
            // picker Type
            .pickerStyle(.wheel)
            .padding()
            .border(Color.green, width: 0.5)

            
            // pickerView가 선택 됬을 때 알고 있는 index는 selection에 설정한 친구
            Text("Selected Item : \(imgFileName[selectedImg])")
                .padding()
            
            
            Image(imgFileName[selectedImg])
                .resizable()
                .frame(width: 350, height: 200)
            
            
        } // VStack
        .padding()
    } // body
    
} // ContentView

#Preview {
    ContentView()
}
