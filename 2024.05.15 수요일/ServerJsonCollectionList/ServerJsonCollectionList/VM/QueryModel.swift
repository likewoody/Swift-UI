//
//  QueryModel.swift
//  ServerJsonImageListRe
//
//  Created by Woody on 5/15/24.
//

import Foundation

struct QueryModel {
    func loadJsonData(url: URL) async throws -> [JSONModel] {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([JSONModel].self, from: data)
    }
}
