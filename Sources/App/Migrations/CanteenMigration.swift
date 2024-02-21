//
//  File.swift
//  
//
//  Created by Razan Alabdulkarim on 09/08/1445 AH.
//

import Fluent

struct CanteenMigration : AsyncMigration{
    //add - create
    func prepare(on database: Database) async throws {
        try await database.schema("canteendb")
            .id()
            .field("school_name", .string)
            .field("capacity", .int)
            .field("location", .string)
            .create()
    }
    
    //undo - deleate
    func revert(on database: Database) async throws {
        try await database.schema("canteendb")
            .delete()
    }
}
