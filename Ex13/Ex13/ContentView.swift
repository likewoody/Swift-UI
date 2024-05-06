//
//  ContentView.swift
//  Ex13
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var danList = [Int](2...9)
    @State var selectedDan: Int = 0
    @State var showTextEditor: String = ""
    
    var body: some View {
        VStack {
            Text("\(danList[selectedDan])단")
                .bold()
                .font(.system(.largeTitle))
            
            Picker("", selection: $selectedDan, content: {
                ForEach(0..<danList.count, id: \.self, content: { index in
                    
                    Text("\(danList[index])단")
                    
                }) // Foreach
                // Foreach에 대한 이벤트
                .onChange(of: selectedDan, {
                    showTextEditor.removeAll()
                    gugudan()
                    
                }) // onChange
                
            }) // Ppicker
            .pickerStyle(.wheel)
            
//            TextEditor(text: .constant("\n\(showTextEditor)"))
//                .colorMultiply(.gray.opacity(0.7))
//                .frame(width: 300, height: 300)
//                .clipShape(.rect(cornerRadius: 10))
//                .multilineTextAlignment(.center)
//                .frame(alignment: .leading)
            
            ScrollView(content: {
                Text("\n\(showTextEditor)")
            })
            // 라인을 10줄까지만 보여준다.
            .lineLimit(10)
            .frame(width: 200, height: 250)
            .background(.blue.opacity(0.7))
            .clipShape(.rect(cornerRadius: 15))
            
        } // VStack
        .padding()
        .onAppear(perform: {
            gugudan()
        })
        
    } // body
    
    // --- Function ----
    func gugudan() {
        for i in 1...9{
            showTextEditor += "\(selectedDan+2) * \(i) = \((selectedDan+2) * i)\n"
        } // for
    }
    
} // ContentView

#Preview {
    ContentView()
}
