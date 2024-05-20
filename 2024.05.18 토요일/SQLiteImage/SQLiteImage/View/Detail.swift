//
//  Detail.swift
//  SQLite
//
//  Created by Woody on 5/17/24.
//

import SwiftUI
import PhotosUI

struct Detail: View {
    
    @State var student: Students
    @FocusState var isTextFieldFocused: Bool
    @State var isUpdate: Bool = false
    @State var isDelete: Bool = false
    @State var image: UIImage?
    @State var selectedImg: PhotosPickerItem?
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack(content: {
                Text("학번 :  ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("학번 입력", value: $student.id, formatter: NumberFormatter()) // int값 넣을 땐 이렇게 formatter 해줘야함
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
                    .disabled(true)
            }) // 학번
            HStack(content: {
                Text("이름 :  ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("성명 입력", text: $student.name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 이름
            HStack(content: {
                Text("전화 :  ")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("번호 입력", text: $student.phone)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 전화번호
            HStack(content: {
                Text("학과 :  ")
                TextField("학과 입력", text: $student.dept)
                    .frame(minWidth: 50, alignment: .leading)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 180)
                    .focused($isTextFieldFocused)
            }) // 학과
            
        }) // VStack
        .navigationTitle("Detail View")
        
        // 입력 버튼을 가운데 배치하기 위해
        VStack(content: {
            // 이미지가 있다면 먼저 이미지를 보여주고
            if let image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
            }
            Spacer()
            
            // 사진을 선택한다면 사진을 바꿔준다.
            PhotosPicker("사진 선택", selection: $selectedImg, matching: .images)
                .padding()
                .onChange(of: selectedImg, {
                    Task{
                        if let data = try? await selectedImg?.loadTransferable(type: Data.self){
                            image = UIImage(data: data)
                        }
                    } // Task
                }) // onChange
            
            Button("Update", action: {
                let queryModel = StudentDB()
                isUpdate = queryModel.updateDB(name: student.name, dept: student.dept, phone: student.phone, id: Int(student.id), image: image!)
            })
            .padding(10)
            .frame(width: 100)
            .background(.green)
            .foregroundColor(.white)
            .alert("알림", isPresented: $isUpdate, actions: {
                Button("수정 되었습니다.", action: {
                    dismiss()
                }) // Button
            }) // alert
            
            Button("Delete", action: {
                let queryModel = StudentDB()
                Task{
                    isDelete = await queryModel.deleteDB(id: Int(student.id))
                }
                
            })
            .padding(10)
            .frame(width: 100)
            .background(.green)
            .foregroundColor(.white)
            .alert("알림", isPresented: $isDelete, actions: {
                Button("삭제 되었습니다.", action: {
                    dismiss()
                }) // Button
            }) // alert
            
        }) // VStack
    } // body
} // ContentView

//#Preview {
//    Detail(student: Students(id: 1, name: "유비", dept: "경영학과", phone: "001"))
//}
