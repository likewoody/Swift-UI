//
//  AddressList.swift
//  FirebaseImageAddress
//
//  Created by Woody on 5/19/24.
//

struct DBModel: Codable{
    var id: String
    var name: String
    var phone: String
    var address: String
    var relation: String
    var imageAddress: String
    
    init(id: String, name: String, phone: String, address: String, relation: String, imageAddress: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.address = address
        self.relation = relation
        self.imageAddress = imageAddress
    }
}

extension DBModel: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
