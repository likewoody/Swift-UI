//
//  AddView.swift
//  Table
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

struct AddView: View {
    
    // 입력 데이터
    @State var inputText = ""
    @FocusState var isTextFieldFocused: Bool
    
    // ContentView에서 받을 List 아이템
    @Binding var todoLists: [TodoList]
    
    // Get.pop()의 역할을 한다.
    @Environment(\.dismiss) var dismiss
    
    
    @State var imgFileName: [String] = ["flower_01","flower_02","flower_03"]
    
    @State var selectedImg: Int = 0
    
    
    var body: some View {
        VStack(content: {
            
            HStack(content: {
                
                // 최소 50이상은 띄워라.
                Spacer(minLength: 50)
                
                Image(imgFileName[selectedImg])
                    .resizable()
                    .frame(width: 100, height: 150)
                // Title 생략
                Picker("", selection: $selectedImg, content: {
                    ForEach(0..<imgFileName.count, id: \.self, content: { index in
                        Image(imgFileName[index])
                            .resizable()
                            .frame(width: 50)
                            .scaledToFit()
                        
                    }) // ForEach
                    
                }) // Picker
                .pickerStyle(.wheel)
                
            }) // HStack
            
            
            Text("항목")
                .bold()
                .font(.system(size: 20))
            
            TextField("Text", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)
                .focused($isTextFieldFocused)
            
            Button("추가", action: {
                
                if !inputText.isEmpty {
                    todoLists.append(TodoList(images: imgFileName[selectedImg], items: inputText))
                }
                
                // TextField 초기화
                inputText.removeAll()
                // 키보드 내리기
                isTextFieldFocused = false
                
                dismiss()
            }) // Button
            
        }) // VStack
        .navigationTitle("Add Page")
        .navigationBarTitleDisplayMode(.inline)
        
    } // body
    
} // AddView

#Preview {
    AddView( todoLists: .constant([]))
}
