//
//  QueryModel.swift
//  ServerJson_02
//
//  Created by Woody on 5/15/24.
//

import Foundation

struct QueryModel{
    // --- Function ---
    func getJsonData(url: URL) async throws -> [StudentJSON]{
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([StudentJSON].self, from: data)
    }
}
