//
//  File.swift
//  
//
//  Created by Razan Alabdulkarim on 11/08/1445 AH.
//

import Fluent

struct ItemsInCanteenMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("canteendb")
            .id()
            .field("item_id", .uuid, .references("items", "id"))
            .field("canteen_id", .uuid, .references("canteens", "id"))
            .field("quantity", .int)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("canteendb")
            .delete()
    }
}
