//
//  File.swift
//  
//
//  Created by Razan Alabdulkarim on 08/08/1445 AH.
//

import Vapor
import Fluent 
final class ItemsInCanteen: Model {
    static let schema = "items_in_canteen"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "item_id")
    var item: Item
    
    @Parent(key: "canteen_id")
    var canteen: Canteen
    
    @Field(key: "quantity")
    var quantity: Int
    
    init() {}
    
    init(id: UUID? = nil, itemID: UUID, canteenID: UUID, quantity: Int) {
        self.id = id
        self.$item.id = itemID
        self.$canteen.id = canteenID
        self.quantity = quantity
    }
}
