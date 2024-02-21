//
//  File.swift
//
//
//  Created by Sara Ibrahim Almashharawi on 15/02/2024.
//


import Foundation
import Vapor

struct StaffControllers: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        let staff = routes.grouped("staff")
        staff.post( use: createStaff)
        staff.get( "canteen",":CanteenID",use: readStaffinCantten)
        staff.get(":id", use: readStaff)
        staff.put( ":id", use: updateStaff)
        staff.delete( ":id", use: deleteStaff)
    }

}
// take data from body and create staff
func createStaff(req: Request) async throws -> String {
    let newstaff = try req.content.decode(Staff.self)
    return "new canteen created"
}

//
func readStaffinCantten(req: Request) async throws -> [Staff] {
    let CanteenID = req.parameters.get("CanteenID", as: UUID.self)
    let staff: [Staff] = [.init()]
    return staff
}

func readStaff(req: Request) async throws -> String {
    let staffID = req.parameters.get("id", as: UUID.self)
    
    return "staff is read"
}

func updateStaff(req: Request) async throws -> String {
    guard let staffID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
    
    let staffUpdate = try req.content.decode(Staff.self)

    return " staff updated"
}

func deleteStaff(req: Request) async throws -> String {
    let staffId = req.parameters.get("id", as: UUID.self)
    return " staff deleted"
}
