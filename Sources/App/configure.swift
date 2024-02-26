import Vapor
import Fluent
import FluentPostgresDriver
// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.postgres(configuration:
                                    SQLPostgresConfiguration(hostname: "localhost",
                                                             username: "postgres", password: "",
                                                             database: "canteendb",
                                                             tls:.prefer(try .init(configuration: .clientDefault)))),     as: .psql)
    
    // register routes
    try routes(app)
    
    
    app.migrations.add(CreateCanteenTableMigration())
    app.migrations.add(CreateStaffTable())
    app.migrations.add(ItemMigration())
    app.migrations.add(ItemsInCanteenMigration())
    
    try await app.autoMigrate()
}
