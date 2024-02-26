//
//  File.swift
//  
//
//  Created by alhanouf alhamied on 11/08/1445 AH.
//

import Foundation
import FluentKit

struct ItemMigration: AsyncMigration{
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("items")
            .id()
            .field("name", .string)
            .field("price", .double)
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("items")
            .delete()
    }
}
