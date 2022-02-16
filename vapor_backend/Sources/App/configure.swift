//import Fluent
//import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    /*
    app.databases.use(
        .postgres(
            hostname: Environment.get("DATABASE_HOST") ?? "35.234.68.205",
            port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
            username: Environment.get("DATABASE_USERNAME") ?? "postgres",
            password: Environment.get("DATABASE_PASSWORD") ?? "KK2oxy6JFOIlt0Fn",
            database: Environment.get("DATABASE_NAME") ?? "tourdata"
        ), as: .psql)

    app.migrations.add(CreateTour())
    try app.autoMigrate().wait()
    */
    
    // register routes
    try routes(app)
}
