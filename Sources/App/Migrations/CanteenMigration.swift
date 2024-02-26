//
//  File.swift
//
//
//  Created by Sara Ibrahim Almashharawi on 20/02/2024.
//


import Fluent

struct CreateCanteenTableMigration : AsyncMigration{
    
    func prepare(on database: Database) async throws {
        try await database.schema("canteens")
            .id()
            .field("school_name", .string)
            .field("capacity", .int)
            .field("location", .string)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("canteens")
            .delete()
        
    }
}
