//import Fluent
import Vapor

struct TourController: RouteCollection {
    private let troursData: [Item]
    
    init(tours: [Item]) {
        self.troursData = tours
    }
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("tour", use: self.tour)
        routes.get("distance", use: self.distance)
        
        let tours = routes.grouped("tours")
        tours.get(use: self.tours)
        
        //tours.post(use: self.create)
        tours.group(":tourID") { tour in
            // tour.delete(use: self.delete)
        }
    }
    
    func tours(req: Request) throws -> EventLoopFuture<[Item]> {
        var tours = self.troursData
        
        if let random: Bool = req.query["random"], random {
            tours = tours.shuffled()
        }
        
        if let offset: Int = req.query["offset"] {
            tours = tours.dropLast(offset)
        }
        
        if let count: Int = req.query["count"] {
            tours = Array(tours.prefix(count))
        }
        
        let future: EventLoopFuture<[Item]> = req.eventLoop.makeSucceededFuture(tours)
        return future
        // return Tour.query(on: req.db).all()
    }
    
    // http://127.0.0.1:8080/tour
    func tour(req: Request) throws -> EventLoopFuture<Item> {
        let future: EventLoopFuture<Item> = req.eventLoop.makeSucceededFuture(self.troursData.randomElement()!)
        return future
    }
    
    // http://127.0.0.1:8080/distance?tourID=100394&latitude=47.88&longitude=14.4
    func distance(req: Request) throws -> EventLoopFuture<Double> {
        guard let tourID: String = req.query["tourID"],
              let latitude: Double = req.query["latitude"],
              let longitude: Double = req.query["longitude"] else {
                  return req.eventLoop.makeFailedFuture("no get values")
        }
        
        // location guess
        let locationGuess = try! GeoCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )

        // location tour
        let item: Item? = self.troursData.first { item in
            "\(item.id)" == tourID
        }
        guard let item = item else {
            return req.eventLoop.makeFailedFuture("no item")
        }
        
        let main = item.geo.main
        /*
        guard let value: String = item.geo.geometry?.value else {
            return req.eventLoop.makeFailedFuture("no geometry value")
        }
        var splits = value.split(separator: " ", omittingEmptySubsequences: false)
        let latitudeItem: Double = Double(splits.first!)!
        splits.removeFirst()
        let longitudeItem: Double = Double(splits.first!)!
        */
        
        let itemDestination = try! GeoCoordinate2D(latitude: main.latitude, longitude: main.longitude)

        // Finding my distance (in km)
        let distance = locationGuess.distance(from: itemDestination) / 1000
        //debugPrint(distance)
        
        let future: EventLoopFuture<Double> = req.eventLoop.makeSucceededFuture(distance)
        return future
    }

    /*
    func create(req: Request) throws -> EventLoopFuture<Tour> {
        let todo = try req.content.decode(Tour.self)
        return todo.save(on: req.db).map { todo }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Tour.find(req.parameters.get("tourID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    */
}

extension String: Error {}
