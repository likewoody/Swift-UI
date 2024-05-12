//
//  AddView.swift
//  Quiz17
//
//  Created by Woody on 5/11/24.
//

import SwiftUI

struct AddView: View {
    
    @State var newItem: String = ""
    // 키보드 내리기 위한 State
    @FocusState var isTextFieldFocused: Bool
    // 앞 화면의 todoList와 연결
    @Binding var todoLists: [TodoList]
    // Get.pop() 같은 녀석
    @Environment(\.dismiss) var dismiss
    
    
    // alert State
    @State var alert = false
    
    // pickerView 들어갈 Image
    let imageFileName = ["pause", "play", "stop"]
    @State var selectedImage = 0
    
    var body: some View {
        VStack(content: {
            
            HStack(content: {
                
                Spacer(minLength: 50)
                
                Image(imageFileName[selectedImage])
                    .resizable()
                    .frame(width: 70, height: 70)
                    .scaledToFit()
                
                
                Picker("", selection: $selectedImage, content: {
                    ForEach(0..<imageFileName.count, id: \.self, content: { index in
                        Image(imageFileName[index])
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                        
                    }) // ForEach
                    
                }) // Picker
                .labelsHidden()
                .pickerStyle(.wheel)
                .padding()
                
                Spacer(minLength: 30)

            }) // HSatck
            
            HStack(content: {
                Text("내용 : ")
                    .padding(.trailing, 15)
                
                TextField("", text: $newItem)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .multilineTextAlignment(.leading)
                    .keyboardType(.default)
                    // keyboard 내리기
                    .focused($isTextFieldFocused)
            }) // HStack
            .padding()
            
            Button("Add", action: {
                // 이 todoLists는 앞에 todoList와 연결되어 있는 Binding이다.
                if !newItem.isEmpty {
                    todoLists.append(TodoList(item: newItem, itemImageFile: imageFileName[selectedImage]))
                    
                    
                    // 초기화 시키고 키보드 내리고 pop 하기
                    newItem = ""
                    isTextFieldFocused = false
                    dismiss()
                }else {
                    alert = true
                }
            }) // Button
            .alert(isPresented: $alert) {
                Alert(title: Text("경고"), message: Text("새 항목을 입력해주세요."), dismissButton: .default(Text("확인")))
            }
            
            
        }) // VStack
        .navigationTitle("Add Page")
        .navigationBarTitleDisplayMode(.inline)
        
        
    } // body
        
    
} // AddView

#Preview {
    AddView(todoLists: .constant([]))
}
