//
//  Detail.swift
//  CollectionView_image
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct Detail: View {
    
    // Image 받아오기
    var img: String
    
    var body: some View {
        VStack(content: {
            Image(img)
                .resizable()
                .frame(width: 200, height: 300)
                .clipShape(.rect(cornerRadius: 10))
        })
        .navigationTitle("Detail View")
    }
}

//#Preview {
//    Detail()
//}
