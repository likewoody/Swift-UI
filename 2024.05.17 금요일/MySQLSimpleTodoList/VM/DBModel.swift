//
//  DBModel.swift
//  MySQLSimpleTodoList
//
//  Created by Woody on 5/18/24.
//

import Foundation

struct SearchQuery{
    func loadData(url: URL) async throws -> [Todo]{
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([Todo].self, from: data)
    }
}

// Create, Update, Delete
struct CUDQuery{
    func createOrupdateOrdelete(url: URL) async throws -> Bool{
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if data.isEmpty{
            return false
        }else{
            return true
        }
    }
}

