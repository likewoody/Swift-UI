//
//  DomeInsert.swift
//  FavoriteFood
//
//  Created by Woody on 5/19/24.
//

import SwiftUI
import PhotosUI

struct DomeInsert: View {
    
    @State var image: UIImage?
    @State var title: String = ""
    @State var description: String = ""
    @State var date = Date()
    @State var lat: String = ""
    @State var lng: String = ""
    @State var selectedImg: PhotosPickerItem?
    @State var isAlert: Bool = false
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        // HH -> 24, hh -> 12
        formatter.dateFormat = "yyyy-MM-dd EEE"
        
        return formatter
    }
    
    @FocusState var isTextFieldFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Spacer()
        
        ScrollView(content: {
            VStack(content: {
                Spacer()
                TextField("제목", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300)
                    .multilineTextAlignment(.leading)
                    .focused($isTextFieldFocused)
                    .keyboardType(.default)
                    .padding()
                
                TextField("내용", text: $description, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 200, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .focused($isTextFieldFocused)
                    .lineLimit(nil)
                    // height 사이즈에 맞는 테두리 만들기
                    .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    .padding()
                
                HStack(content: {
                    TextField("위도", text: $lat)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 150)
                        .multilineTextAlignment(.leading)
                        .focused($isTextFieldFocused)
                    
                    TextField("경도", text: $lng)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 150)
                        .multilineTextAlignment(.leading)
                        .focused($isTextFieldFocused)
                })
                .padding()
                
                // image
                if let image{
                    Image(uiImage: image)
                        .resizable()
                        .padding()
                        .frame(maxWidth: 300, maxHeight: 200)
                        .scaledToFit()
                } // if let
                
                Spacer()
                
                // 사진 선택
                PhotosPicker("사진 선택", selection: $selectedImg, matching: .images)
                    .padding()
                    .onChange(of: selectedImg, {
                        Task{
                            if let data = try? await selectedImg?.loadTransferable(type: Data.self){
                                image = UIImage(data: data)
                            }
                        } // Task
                    }) // onChange
                    .frame(width: 120)
                    .foregroundStyle(.black)
                    
                
                
                VStack(content: {
                    
                    Button("추가", action: {
                        let formattedDate = dateFormatter.string(from: date)

                        let query = DBModel()
                        Task{
                            isAlert = await query.insertDB(title: title, description: description, date: formattedDate, image: image!, lat: lat, lng: lng)
                        }
                    })

                    .padding()
                    .frame(width: 100)
                    .foregroundStyle(.white)
                    .background(.indigo)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
        //            .overlay {
        //                RoundedRectangle(cornerRadius: 2)
        //                    .stroke(.indigo, lineWidth: 1.0)
        //            }
                    .alert("알림", isPresented: $isAlert, actions: {
                        Button("맛집 목록에 추가 되었습니다.", action: {dismiss()})
                    })
                })
                
                
            }) // VStack
            .ignoresSafeArea(.all)
            .navigationTitle("맛집 추가하기")
            .frame(maxWidth: .infinity)

        }) // ScrollView
        
                
//        GeometryReader{ geometry in
//            ZStack(content: {
//                Button("추가", action: {
//                    
//                    let formattedDate = dateFormatter.string(from: date)
//                    
//                    let query = DBModel()
//                    Task{
//                        isAlert = await query.insertDB(title: title, description: description, date: formattedDate, image: image!, lat: Double(lat)!, lng: Double(lng)!)
//                    }
//                })
//                
//                .padding()
//                .frame(width: 100)
//                .foregroundStyle(.white)
//                .background(.indigo)
//                .clipShape(Circle())
//                .offset(CGSize(width: geometry.size.width / 2 - 50, height: geometry.size.width - 120))
//    //            .overlay {
//    //                RoundedRectangle(cornerRadius: 2)
//    //                    .stroke(.indigo, lineWidth: 1.0)
//    //            }
//                .alert("알림", isPresented: $isAlert, actions: {
//                    Button("맛집 목록에 추가 되었습니다.", action: {dismiss()})
//                })
//
//            })
//
//            
//        }
                        
        
        
    } // body
    
    // ---- Alert -----
    func alert(){
        
    }
} // ContentView

#Preview {
    DomeInsert()
}
