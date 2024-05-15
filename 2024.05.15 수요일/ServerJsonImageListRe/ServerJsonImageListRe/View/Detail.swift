//
//  Detail.swift
//  ServerJsonImageListRe
//
//  Created by Woody on 5/15/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct Detail: View {
    
    var movie: JSONModel
    var body: some View {
        VStack(content: {
            Spacer()
            WebImage(url: URL(string:movie.image))
                .resizable()
                .frame(width: 100, height: 150)
            Text(movie.title)
            Spacer()
        })
        .navigationTitle("Detail View")
    }
}

//#Preview {
//    Detail()
//}
