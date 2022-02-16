/*
import Fluent

struct CreateTour: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tours")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tours").delete()
    }
}
*/
