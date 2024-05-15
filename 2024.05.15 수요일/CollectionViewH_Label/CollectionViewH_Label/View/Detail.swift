//
//  Detail.swift
//  CollectionView_Label
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct Detail: View {
    
    var name: String
    
    var body: some View {
        VStack(content: {
            Text(name)
                .bold()
                .font(.system(size: 30))
        })
        .navigationTitle("Detail Page 입니다.")
        .navigationBarTitleDisplayMode(.inline)
    
    }
}

//#Preview {
//    Detail()
//}
