//
//  File.swift
//
//
//  Created by Sara Ibrahim Almashharawi on 15/02/2024.
//


import Foundation
import Fluent
import Vapor

struct StaffControllers: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        let staff = routes.grouped("staff")
        staff.post( use: createStaff)
        staff.get( "canteen",":CanteenID",use: readStaffinCantten)// not yet
        staff.get(":id", use: readStaff)
        staff.put( use: updateStaff)
        staff.delete( ":id", use: deleteStaff)
    }

}
// take data from body and create staff
func createStaff(req: Request) async throws -> Staff {
    let newstaff = try req.content.decode(Staff.self)
    try await newstaff.create(on: req.db)
    return newstaff
}

//
func readStaffinCantten(req: Request) async throws -> [Staff] {
     let canteenID = req.parameters.get("CanteenID", as: UUID.self)
    
    guard let canteenID else {
       throw Abort(.notFound)
    }
    
   guard let canteen = try await  Canteen.find(canteenID, on: req.db)  else {
       throw Abort(.notFound)
    }
    
    return try await canteen.$staff.get(on: req.db)
// return try await  Staff.query(on: req.db)
//        .filter(\.$name == "Earth")
//        .all()
   //try  Staff.query(on: req.db)
     //   .filter(\<#Root#>.$canteen.$id == CanteenID)
        //.filter(\.$canteen.$id == CanteenID)
        //.all()
//   try await Canteen.query(on: req.db)
//        .filter(\.id == CanteenID)
//        //.with(\.$staff)
//        .all()
    
    
   // let staff: [Staff] = try await Staff.query(on: req.db).filter(\.$canteen == CanteenID).all()
   // return staff
}

func readStaff(req: Request) async throws -> Staff {
    let staffID = req.parameters.get("id", as: UUID.self)
    guard let staffinDb = try await Staff.find(staffID, on: req.db) else {
        throw Abort(.notFound)
    }
    return staffinDb
}

func updateStaff(req: Request) async throws -> Staff {
    let newStaff = try req.content.decode(Staff.self)
    guard let staffinDb = try await Staff.find(newStaff.id, on: req.db) else {
        throw Abort(.notFound)
    }
    
    staffinDb.name = newStaff.name
    staffinDb.phoneNumber = newStaff.phoneNumber
    staffinDb.role = newStaff.role
    staffinDb.salary = newStaff.salary
    try await staffinDb.save(on: req.db)
    
    return newStaff
}

func deleteStaff(req: Request) async throws -> Staff {
    let staffId = req.parameters.get("id", as: UUID.self)
    guard let staffinDb = try await Staff.find(staffId, on: req.db) else {
        throw Abort(.notFound)
    }
    
    try await staffinDb.delete(on: req.db)
    return staffinDb
}
