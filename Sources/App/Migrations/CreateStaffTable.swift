//
//  File.swift
//
//
//  Created by Sara Ibrahim Almashharawi on 20/02/2024.
//

import Fluent

struct CreateStaffTable : AsyncMigration{
    
    func prepare(on database: Database) async throws {
        try await database.schema("staff")
            .id()
            .field("name", .string)
            .field("salary", .double)
            .field("phone_num", .string)
            .field("role", .string)
            .field("canteen_id", .uuid, .references("canteens", "id"))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("staff")
            .delete()
        
    }
}
