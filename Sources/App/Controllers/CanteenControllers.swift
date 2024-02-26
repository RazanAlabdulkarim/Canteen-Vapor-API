//
//  File.swift
//
//
//  Created by Sara Ibrahim Almashharawi on 15/02/2024.
//

import Foundation
import Vapor

struct CanteenControllers: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        let Canteens = routes.grouped("canteens")
        Canteens.post( use: create)
        Canteens.get( ":id",  use: read)
        Canteens.get( use: readAll)
        Canteens.put( ":id", use: update)
        Canteens.delete( ":id", use: delete)
    }
    
}

func create(req: Request) async throws -> Canteen {
    let newcanteen = try req.content.decode(Canteen.self)
    try await newcanteen.create(on: req.db)
    return newcanteen
}

func read(req: Request) async throws -> Canteen {
    let canteenId = req.parameters.get("id", as: UUID.self)
    guard let canteenInDB = try await Canteen.find(canteenId, on: req.db) else {
        throw Abort(.notFound)
    }
    return canteenInDB
    
}

func readAll(req: Request) async throws -> [Canteen] {
    
    return try await Canteen.query(on: req.db).all()
    
}

func update(req: Request) async throws -> Canteen {
    let newCanteen = try req.content.decode(Canteen.self)
    guard let canteeninDb = try await Canteen.find(newCanteen.id, on: req.db) else {
        throw Abort(.notFound)
    }

    canteeninDb.schoolName = newCanteen.schoolName
    canteeninDb.capacity = newCanteen.capacity
    canteeninDb.location = newCanteen.location
    try await canteeninDb.save(on: req.db)
    
    return newCanteen
}

func delete(req: Request) async throws -> Canteen {
    let canteenId = req.parameters.get("id", as: UUID.self)
    guard let canteeninDb = try await Canteen.find(canteenId, on: req.db) else {
        throw Abort(.notFound)
    }
    
    try await canteeninDb.delete(on: req.db)
    return canteeninDb
}
