//
//  ContentView.swift
//  Multiline
//
//  Created by Woody on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var inputText = ""
    @State var enteredText = ""
    
    var body: some View {
        VStack {
            Text("TextEditor를 이용한 여러 Line 출력")
                .bold()
                .padding()
            
            HStack(content: {
                TextField("문자 입력", text: $inputText)
                    .frame(width: 250)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                    .keyboardType(.default)
                    .focused($isTextFieldFocused)
                
                Button("추가", action: {
                    // Check trimming
                    let textCheck = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !textCheck.isEmpty{
                        enteredText += "\(textCheck)\n"
                    }
                    
                    // 키보드 내리기
                    isTextFieldFocused = false
                    inputText.removeAll()
                })
            })
            
            TextEditor(text: $enteredText)
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: .infinity)
                .foregroundStyle(.black).bold()
                // Background Color
                .colorMultiply(.gray.opacity(0.7))
                .clipShape(.rect(cornerRadius: 15))
                .disabled(true)
                .padding()
            
        } // End VStack
        .padding()
        
    } // End body
    
} // End ContentView

#Preview {
    ContentView()
}
