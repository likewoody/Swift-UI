//
//  Food.swift
//  FavoriteFood
//
//  Created by Woody on 5/19/24.
//

import SwiftUI

struct Food{
    var id: Int
    var title: String
    var description: String
    var date: String
    var image: UIImage
    var lat: String
    var lng: String
    
    init(id: Int, title: String, description: String, date: String, image: UIImage, lat: String, lng: String) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.image = image
        self.lat = lat
        self.lng = lng
    }
}

extension Food: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
