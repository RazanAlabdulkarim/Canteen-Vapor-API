//
//  File.swift
//
//
//  Created by Razan Alabdulkarim on 08/08/1445 AH.
//

import Vapor
import Fluent

final class Item: Model, Content {
    static let schema = "items"
    
    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "price")
    var price: Double
    
    // Relationship: ItemsInCanteen
    @Siblings(through: ItemsInCanteen.self, from: \.$item, to: \.$canteen)
    var canteens: [Canteen]
    
    init() {}
    
    init(id: UUID? = nil, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
}
