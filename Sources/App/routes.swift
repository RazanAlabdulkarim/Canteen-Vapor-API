import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: CanteenControllers())
    
    try app.register(collection: StaffControllers())

    try app.register(collection: ItemController())
    
    try app.register(collection: ItemsInCanteenController())
    
    
}
