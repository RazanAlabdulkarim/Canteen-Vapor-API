//
//  File.swift
//
//
//  Created by Sara Ibrahim Almashharawi on 18/02/2024.
//

//
//  File.swift
//
//
//  Created by Razan Alabdulkarim on 08/08/1445 AH.
//

import Vapor
import Fluent

final class Staff: Model, Content {
    static let schema = "staff"
    
    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "salary")
    var salary: Double
    
    @Field(key: "phone_num")
    var phoneNumber: String
    
    @Field(key: "role")
    var role: String
    
    // Relationship: Canteen
    @Parent(key: "canteen_id")
    var canteen: Canteen
    
    init() {}
    
    init(id: UUID? = nil, name: String, salary: Double, phoneNumber: String, role: String, canteenID: UUID) {
        self.id = id
        self.name = name
        self.salary = salary
        self.phoneNumber = phoneNumber
        self.role = role
        self.$canteen.id = canteenID
    }
}
