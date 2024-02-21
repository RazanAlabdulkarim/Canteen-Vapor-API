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
        Canteens.put( ":id", use: update)
        Canteens.delete( ":id", use: delete)
    }

}

func create(req: Request) async throws -> String {
    let newcanteen = try req.content.decode(Canteen.self)
    return "new canteen created"
}

func read(req: Request) async throws -> String {
    let CanteenID = req.parameters.get("CanteenID", as: UUID.self)
    return "canteen read"
}

func update(req: Request) async throws -> String {
    guard let canteenID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
    
    let canteenUpdate = try req.content.decode(Canteen.self)

    return " canteen updated"
}

func delete(req: Request) async throws -> String {
    let CanteenID = req.parameters.get("id", as: UUID.self)
    return " canteen deleted"
}
