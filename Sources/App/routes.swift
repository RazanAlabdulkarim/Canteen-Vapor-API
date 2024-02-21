import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: CanteenControllers())
    
    try app.register(collection: StaffControllers())

    
//    app.group("canteens"){ canteens in
//        app.get("all") { req async -> String in
//        return "all canteens displayed"}
//
//        app.get("create") { req async -> String in
//        return "new canteen created"}
//
//    }
}
