//
//  Detail.swift
//  CollectionView_multi
//
//  Created by Woody on 5/15/24.
//

import SwiftUI

struct Detail: View {
    
    var animal: Animal

    
    var body: some View {
        VStack(content: {
            Image(animal.img)
                .resizable()
                .frame(maxWidth: 100, maxHeight: 150)
            Text("이 동물의 이름은 \(animal.name)이며 분류는 \(animal.type)이며 날 수 \(animal.fly)습니다.")
                .multilineTextAlignment(.leading)
        }) // VStack
        .navigationTitle("Detail View")
    } // body
} // Detail

//#Preview {
//    Detail()
//}
