//
//  File.swift
//
//
//  Created by alhanouf alhamied on 11/08/1445 AH.
//
//

import Foundation
import Vapor
import Fluent

struct ItemsInCanteenController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let itemsInCanteen = routes.grouped("itemsInCanteen")
        itemsInCanteen.post(use: create)
        itemsInCanteen.get( use: readAll)
        itemsInCanteen.get(":id", use: read)
        itemsInCanteen.put(use: update)
        itemsInCanteen.delete(":id", use: delete)
    }
    
    func create(req: Request) async throws -> ItemsInCanteen {
        let newItemsInCanteen = try req.content.decode(ItemsInCanteen.self)
        try await newItemsInCanteen.create(on: req.db)
        return newItemsInCanteen
    }
    
    
    func update(req: Request) async throws -> ItemsInCanteen {
        let newQuantity = try req.content.decode(ItemsInCanteen.self)
        guard let ItemsInCanteenDB = try await ItemsInCanteen.find(newQuantity.id, on: req.db) else {
            throw Abort(.notFound)
        }
        ItemsInCanteenDB.quantity = newQuantity.quantity
        try await ItemsInCanteenDB.save(on: req.db)
        return newQuantity
    }
    
    func delete(req: Request) async throws -> ItemsInCanteen {
        let ItemsInCanteenId = req.parameters.get("id", as: UUID.self)
        guard let ItemsInCanteenDB = try await ItemsInCanteen.find(ItemsInCanteenId, on: req.db) else {
            throw Abort(.notFound)
        }
        try await ItemsInCanteenDB.delete(on: req.db)
        return ItemsInCanteenDB
    }
    
    func readAll (req: Request) async throws -> [ItemsInCanteen] {
        return try await ItemsInCanteen.query(on: req.db).all()
    }
    
    func read(req: Request) async throws -> ItemsInCanteen {
        let ItemsInCanteenId = req.parameters.get("id", as: UUID.self)
        guard let ItemsInCanteenInDB = try await ItemsInCanteen.find(ItemsInCanteenId, on: req.db) else {
            throw Abort(.notFound)
        }
        return ItemsInCanteenInDB
    }
    
}

