//
//  File.swift
//  
//
//  Created by Razan Alabdulkarim on 08/08/1445 AH.
//
import Vapor
import Fluent

final class Canteen: Model, Content {
    static let schema = "canteens"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "school_name")
    var schoolName: String
    
    @Field(key: "capacity")
    var capacity: Int
    
    @Field(key: "location")
    var location: String
    
    // Relationship: ItemsInCanteen
    @Siblings(through: ItemsInCanteen.self, from: \.$canteen, to: \.$item)
    var items: [Item]
    
    init() {}
    
    init(id: UUID? = nil, schoolName: String, capacity: Int, location: String) {
        self.id = id
        self.schoolName = schoolName
        self.capacity = capacity
        self.location = location
    }
}

