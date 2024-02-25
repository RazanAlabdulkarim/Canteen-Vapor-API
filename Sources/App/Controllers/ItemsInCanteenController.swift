//
//  File.swift
//
//
//  Created by alhanouf alhamied on 11/08/1445 AH.
//
//
//import Foundation
//import Vapor
//
//
//struct ItemsInCanteenController: RouteCollection {
//
//    func boot(routes: RoutesBuilder) throws {
//        let itemsInCanteen = routes.grouped("ItemsInCanteen")
//        itemsInCanteen.post(use: create)
//        itemsInCanteen.get(":CanteenId", ":ItemId", use: read)
//        itemsInCanteen.put(use: update)
//        itemsInCanteen.delete(":id", use: delete)
//    }
//
//    func create (req: Request) async throws -> ItemsInCanteen {
//        let newCanteen = try req.content.decode(ItemsInCanteen.self)
//        try await newCanteen.create(on: req.db)
//        return newCanteen
//    }
//
//
//    func update(req: Request) async throws -> ItemsInCanteen {
//        let newCanteen = try req.content.decode(ItemsInCanteen.self)
//        guard let canteenInDB = try await ItemsInCanteen.find(newCanteen.id, on: req.db) else {
//            throw Abort(.notFound)
//        }
//        canteenInDB.quantity = newCanteen.quantity
//        try await canteenInDB.save(on: req.db)
//        return newCanteen
//    }
//
//
//
//    func delete (req: Request) async throws -> ItemsInCanteen {
//        let canteenId = req.parameters.get("id", as: UUID.self)
//        guard let canteenDB = try await ItemsInCanteen.find(canteenId, on: req.db) else {
//            throw Abort (.notFound)
//        }
//        try await canteenDB.delete(on: req.db)
//        return canteenDB
//    }
//
//
//    func read (req: Request) async throws -> [ItemsInCanteen]{
//        return try await ItemsInCanteen.query(on: req.db).all()
//    }
//
//
//}
import Foundation
import Vapor
import Fluent

struct ItemsInCanteenController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let itemsInCanteen = routes.grouped("itemsInCanteen")
        itemsInCanteen.post(use: create)
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
        guard let canteenInDB = try await ItemsInCanteen.find(newQuantity.id, on: req.db) else {
            throw Abort(.notFound)
        }
        canteenInDB.quantity = newQuantity.quantity
        try await canteenInDB.save(on: req.db)
        return newQuantity
    }
    
    func delete(req: Request) async throws -> ItemsInCanteen {
        let ItemsInCanteenId = try req.parameters.get("id", as: UUID.self)
        guard let canteenDB = try await ItemsInCanteen.find(ItemsInCanteenId, on: req.db) else {
            throw Abort(.notFound)
        }
        try await canteenDB.delete(on: req.db)
        return canteenDB
    }
    
    
//    func read(req: Request) async throws -> ItemsInCanteen {
//        let ItemsInCanteenId = try req.parameters.require("id", as: UUID.self)
//        
//        let items = try await ItemsInCanteen.query(on: req.db)
//            .filter(\.$canteen.$id == ItemsInCanteenId)
//            .all()
//        
//        let itemQuantities = try items.map { itemInCanteen in
//            return ItemsInCanteen(itemID: itemInCanteen.item.id, CanteenID: itemInCanteen.canteen.id, quantity: itemInCanteen.quantity)
//        }
//        
//        return itemQuantities
//    }
//    let canteenId = req.parameters.get("id", as: UUID.self)
//    guard let canteenInDB = try await Canteen.find(canteenId, on: req.db) else {
//        throw Abort(.notFound)
//    }
//    return canteenInDB
    
}

