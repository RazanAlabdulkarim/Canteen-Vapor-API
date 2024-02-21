//
//  File.swift
//  
//
//  Created by alhanouf alhamied on 11/08/1445 AH.
//

import Foundation
import Vapor
import Fluent


struct ItemsInCanteenController: RouteCollection {
    
    func boot (routes: Vapor.RoutesBuilder) throws {
        
        let ItemsInCanteen = routes.grouped("ItemsInCanteen")
          ItemsInCanteen.post( use: create)
          ItemsInCanteen.get(":CanteenId", ":itemId", use: read)
        ItemsInCanteen.put( use: update)
        ItemsInCanteen.delete( ":id", use: delete)
        
    }
    

    //done
    func create (req: Request) async throws -> ItemsInCanteen {
        let newCanteen = try req.content.decode(ItemsInCanteen.self)
        try await newCanteen.create(on: req.db)
        return newCanteen
    }
    //done
    func update(req: Request) async throws -> ItemsInCanteen {
        let newCanteen = try req.content.decode(ItemsInCanteen.self)
        guard let canteenInDB = try await ItemsInCanteen.find(newCanteen.id, on: req.db) else {
            throw Abort(.notFound)
        }
        canteenInDB.quantity = newCanteen.quantity
        try await canteenInDB.save(on: req.db)
        return newCanteen
    }
    
    
    //done
    func delete (req: Request) async throws -> ItemsInCanteen {
        let canteenId = req.parameters.get("id", as: UUID.self)
        guard let canteenDB = try await ItemsInCanteen.find(canteenId, on: req.db) else {
            throw Abort (.notFound)
        }
        try await canteenDB.delete(on: req.db)
        return canteenDB
    }
    
    //done
    func read (req: Request) async throws -> [ItemsInCanteen]{
        return try await ItemsInCanteen.query(on: req.db).all()
    }
    
    
//
//    func read (req: Request) async throws -> String {
//        let canteenId = req.parameters.get("CanteenId")
//        let itemId = req.parameters.get("itemId")
//
//        return "itemsin canteen"
//       // return ItemsInCanteen.query(on: req.db).all()
////        return "Items In Canteen read"
//    }
    
}
