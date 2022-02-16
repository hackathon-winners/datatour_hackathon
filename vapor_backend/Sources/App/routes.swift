//import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works! got to tour or tours"
    }
    
    let url = URL(fileURLWithPath: app.directory.workingDirectory)
        .appendingPathComponent("Resources", isDirectory: true)
        .appendingPathComponent("Tour_de.json", isDirectory: false)
    
    //print(url.absoluteString)
    
    do {
        let data = try! Data(contentsOf: url)
        
        //let str = String(decoding: data, as: UTF8.self)
        //debugPrint(str.prefix(30000))
        
        let result = try Result(data: data)
        debugPrint(result.items.count)
        try app.register(collection: TourController(tours: result.items))

    } catch {
        print(error.localizedDescription)
    }
}

struct PostgreSQLVersion: Codable {
    let version: String
}
