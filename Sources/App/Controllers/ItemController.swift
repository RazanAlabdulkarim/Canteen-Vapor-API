//
//  File.swift
//  
//
//  Created by alhanouf alhamied on 11/08/1445 AH.
//

//
//
import Foundation
import Fluent
import Vapor

struct ItemController: RouteCollection {
    
    func boot (routes: Vapor.RoutesBuilder) throws {
        let Items = routes.grouped("items")
        Items.get( use: readAll)
        Items.get( ":id",  use: readById)
        Items.post( use: create)
//        Canteens.put( ":id", use: update)
        Items.put( ":id", use: update)
        Items.delete( ":id", use: delete)
        
    }
    //
    func create (req: Request) async throws -> Item {
        let newItem = try req.content.decode(Item.self)
        try await newItem.create(on: req.db)
        return newItem
    }
    
    func update (req: Request) async throws -> Item {
        let newItem = try req.content.decode(Item.self)
        guard let itemDB = try await Item.find(newItem.id, on: req.db) else {
            throw Abort(.notFound)
        }
        itemDB.name = newItem.name
        itemDB.price = newItem.price
        try await itemDB.save(on: req.db)
        return newItem
    }
    
    func delete (req: Request) async throws -> Item {
        let ItemId = req.parameters.get("id", as: UUID.self)
        guard let ItemDB = try await Item.find(ItemId, on: req.db) else {
            throw Abort (.notFound)
        }
        try await ItemDB.delete(on: req.db)
        return ItemDB
    }
    
    func readAll (req: Request) async throws -> [Item]{
        return try await Item.query(on: req.db).all()
    }
    
    func readById (req: Request) async throws -> Item {
        let ItemId = req.parameters.get("id", as: UUID.self)
        guard let ItemDB = try await Item.find(ItemId, on: req.db) else {
            throw Abort (.notFound)
        }
        return ItemDB
    }
    
}
