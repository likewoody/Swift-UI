//
//  ContentView.swift
//  PhotoLibrary
//
//  Created by Woody on 5/18/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State var selectedItem: PhotosPickerItem?
    
    // 이미지가 nil일 경우 아무 것도 안보여 줄 것이기 때문에 ? optional로 설정
    @State var image: UIImage?
    
    var body: some View {
        VStack {
            // matching이 보면 여러 가지가 있다. ex) video, live photo, images 등등
            PhotosPicker("사진 선택", selection: $selectedItem, matching: .images)
                // selectedItem이 갤러리에서 선택한 이미지를 얘기한다.
                .onChange(of: selectedItem, { // default async
                    Task{
                        if let data = try? await selectedItem?.loadTransferable(type: Data.self){
                            // 데이터가 들어왔다면 여기가 실행된다.
                            image = UIImage(data: data)
                        }
                        print("did not selected image...")
                    } // Task
                    
                }) // onChange
                .padding()
                .background(.green)
                .foregroundStyle(.white)
            
            Spacer()
            
            if let image{
                // image 데이터가 있을 때만 실행
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
            Spacer()
            
        } // VStack
        .padding()
    } // body
} // ContentView

#Preview {
    ContentView()
}
