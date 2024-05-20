//
//  Add.swift
//  SQLite
//
//  Created by Woody on 5/17/24.
//

import SwiftUI
import PhotosUI

struct Add: View {
    
    @State var name: String = ""
    @State var dept: String = ""
    @State var phone: String = ""
    @State var image: UIImage?
    @State var selectedImg: PhotosPickerItem?
    @FocusState var isTextFieldFocused: Bool
    @State var isAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack(content: {
                Text("이름 :  ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("성명 입력", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 이름
            HStack(content: {
                Text("전화 :  ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("번호 입력", text: $phone)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 전화번호
            HStack(content: {
                Text("학과 :  ")
                TextField("학과 입력", text: $dept)
                    .frame(minWidth: 50, alignment: .leading)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 학과
            
            
        }) // VStack
        .navigationTitle("Add View")
        
        // 입력 버튼을 가운데 배치하기 위해
        VStack(content: {
            PhotosPicker("사진 선택", selection: $selectedImg, matching: .images)
                .padding()
                .onChange(of: selectedImg, {
                    Task{
                        if let data = try? await selectedImg?.loadTransferable(type: Data.self){
                            image = UIImage(data: data)
                        }
                    } // Task
                }) // onChange
            
            if let image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
            } // if let
            
            Spacer()
            
            
            Button("Add", action: {
                let queryModel = StudentDB()
                Task{
                    isAlert = await queryModel.insertDB(name: name, dept: dept, phone: phone, image: image!)
                }
                
            }) // Button
            .padding(10)
            .frame(width: 100)
            .background(.green)
            .foregroundColor(.white)
            .alert("알림", isPresented: $isAlert, actions: {
                Button("추가 되었습니다.", action: {
                    dismiss()
                })
            }) // alert
            
        }) // VStack
        .padding()
        
    } // body
    
} // ContentView

#Preview {
    Add()
}
