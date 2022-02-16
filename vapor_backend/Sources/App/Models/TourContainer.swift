// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tourContainer = try TourContainer(json)

import Foundation
import Vapor

// MARK: - TourContainer
class TourContainer: Codable {
    let result: Result

    init(result: Result) {
        self.result = result
    }
}

// MARK: TourContainer convenience initializers and mutators

extension TourContainer {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(TourContainer.self, from: data)
        self.init(result: me.result)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        result: Result? = nil
    ) -> TourContainer {
        return TourContainer(
            result: result ?? self.result
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Result
class Result: Codable {
    let status: String
    let count, overallcount: Int
    let items: [Item]

    init(status: String, count: Int, overallcount: Int, items: [Item]) {
        self.status = status
        self.count = count
        self.overallcount = overallcount
        self.items = items
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    convenience init(data: Data) throws {
        let me = try! newJSONDecoder().decode(Result.self, from: data)
        self.init(
            status: me.status,
            count: me.count,
            overallcount: me.overallcount,
            items: me.items
        )
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        status: String? = nil,
        count: Int? = nil,
        overallcount: Int? = nil,
        items: [Item]? = nil
    ) -> Result {
        return Result(
            status: status ?? self.status,
            count: count ?? self.count,
            overallcount: overallcount ?? self.overallcount,
            items: items ?? self.items
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Item
final class Item: Codable, Content {
    let globalID: String
    let id: String
    let title: String
    let type: TypeEnum
    let categories: [String]
    let texts: [TextContainer]
    let country: String
    let areas: [String]
    let city: String
    let zip: String
    let street: String
    let phone: String?
    let web: String
    let email: String?
    let author: String
    let geo: ItemGeo
    //let ratings: [Double]?
    let mediaObjects: [SubitemMediaObject]
    // let numbers: [Double]?
    //let attributes: ItemAttributes?
    let features: [String]?
    let addresses: [Address]?
    let created, changed: Date?
    //let source: Source?
    let company: String?
    let district: String?
    let postoffice, phone2: String?
    let duration, length, elevationMin, elevationMax: Int?
    let totalAscent, totalDescent: Int?
    let roundTrip: Bool?
    //let seasons: [String]?
    //let subitems: Subitems?
    //let keywords: Keywords?

    enum CodingKeys: String, CodingKey {
        case globalID = "global_id"
        case id, title, type, categories, country, areas, city, zip, street, phone, web, email, author, geo, texts
        case mediaObjects = "media_objects"
        case features, addresses, created, changed, company, district, postoffice, phone2, duration, length, elevationMin, elevationMax, totalAscent, totalDescent, roundTrip//, subitems, keywords
    }

    init(
        globalID: String,
        id: String,
        title: String,
        type: TypeEnum,
        categories: [String],
        texts: [TextContainer],
        country: String,
        areas: [String],
        city: String,
        zip: String,
        street: String,
        phone: String?,
        web: String,
        email: String?,
        author: String,
        geo: ItemGeo,
        //ratings: [Double]?,
        mediaObjects: [SubitemMediaObject],
        // numbers: [Double]?,
        //attributes: ItemAttributes?,
        features: [String]?,
        addresses: [Address]?,
        created: Date?,
        changed: Date?,
        //source: Source?,
        company: String?,
        district: String?,
        postoffice: String?,
        phone2: String?,
        duration: Int?,
        length: Int?,
        elevationMin: Int?,
        elevationMax: Int?,
        totalAscent: Int?,
        totalDescent: Int?,
        roundTrip: Bool?
        //seasons: [String]?,
        //subitems: Subitems?,
        //keywords: Keywords?
    ) {
        self.globalID = globalID
        self.id = id
        self.title = title
        self.type = type
        self.categories = categories
        self.texts = texts
        self.country = country
        self.areas = areas
        self.city = city
        self.zip = zip
        self.street = street
        self.phone = phone
        self.web = web
        self.email = email
        self.author = author
        self.geo = geo
        //self.ratings = ratings
        self.mediaObjects = mediaObjects
        //self.numbers = numbers
        //self.attributes = attributes
        self.features = features
        self.addresses = addresses
        self.created = created
        self.changed = changed
        //self.source = source
        self.company = company
        self.district = district
        self.postoffice = postoffice
        self.phone2 = phone2
        self.duration = duration
        self.length = length
        self.elevationMin = elevationMin
        self.elevationMax = elevationMax
        self.totalAscent = totalAscent
        self.totalDescent = totalDescent
        self.roundTrip = roundTrip
        //self.seasons = seasons
        //self.subitems = subitems
        // self.keywords = keywords
    }
}

// MARK: Item convenience initializers and mutators

extension Item {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Item.self, from: data)
        self.init(
            globalID: me.globalID,
            id: me.id,
            title: me.title,
            type: me.type,
            categories: me.categories,
            texts: me.texts,
            country: me.country,
            areas: me.areas,
            city: me.city,
            zip: me.zip,
            street: me.street,
            phone: me.phone,
            web: me.web,
            email: me.email,
            author: me.author,
            geo: me.geo,
            //ratings: me.ratings,
            mediaObjects: me.mediaObjects,
            // numbers: me.numbers,
            //attributes: me.attributes,
            features: me.features,
            addresses: me.addresses,
            created: me.created,
            changed: me.changed,
            //source: me.source,
            company: me.company,
            district: me.district,
            postoffice: me.postoffice,
            phone2: me.phone2,
            duration: me.duration,
            length: me.length,
            elevationMin: me.elevationMin,
            elevationMax: me.elevationMax,
            totalAscent: me.totalAscent,
            totalDescent: me.totalDescent,
            roundTrip: me.roundTrip
            //seasons: me.seasons,
            //subitems: me.subitems,
            //keywords: me.keywords
        )
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Address
class Address: Codable {
    let phone: String?
    let web: String?
    let email, name, city: String?
    let zip: String?
    let street: Street?
    let phone2: String?

    init(
        phone: String?,
        web: String?,
        email: String?,
        name: String?,
        city: String?,
        zip: String?,
        street: Street?,
        phone2: String?
    ) {
        self.phone = phone
        self.web = web
        self.email = email
        self.name = name
        self.city = city
        self.zip = zip
        self.street = street
        self.phone2 = phone2
    }
}

// MARK: Address convenience initializers and mutators

extension Address {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Address.self, from: data)
        self.init(phone: me.phone, web: me.web, email: me.email, name: me.name, city: me.city, zip: me.zip, street: me.street, phone2: me.phone2)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        phone: String? = nil,
        web: String? = nil,
        email: String? = nil,
        name: String? = nil,
        city: String? = nil,
        zip: String? = nil,
        street: Street? = nil,
        phone2: String? = nil
    ) -> Address {
        return Address(
            phone: phone ?? self.phone,
            web: web ?? self.web,
            email: email ?? self.email,
            name: name ?? self.name,
            city: city ?? self.city,
            zip: zip ?? self.zip,
            street: street ?? self.street,
            phone2: phone2 ?? self.phone2
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Street: String, Codable {
    case none = "none"
}

// MARK: - ItemAttributes
class ItemAttributes: Codable {
    let attribute: [Attribute]

    init(attribute: [Attribute]) {
        self.attribute = attribute
    }
}

// MARK: ItemAttributes convenience initializers and mutators

extension ItemAttributes {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ItemAttributes.self, from: data)
        self.init(attribute: me.attribute)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        attribute: [Attribute]? = nil
    ) -> ItemAttributes {
        return ItemAttributes(
            attribute: attribute ?? self.attribute
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Attribute: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Attribute.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Attribute"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - ItemGeo
class ItemGeo: Codable {
    let main: Location
    let geometry: GeometryValue?
    //let attributes: GeoAttributes?

    init(
        main: Location,
        geometry: GeometryValue?
        /*, attributes: GeoAttributes?*/
    ) {
        self.main = main
        self.geometry = geometry
        //self.attributes = attributes
    }
}

class GeometryValue: Codable {
    let value: String?
}

class TextContainer: Codable {
    let value: String?
    let type: String?
}

class Location: Codable {
    let latitude: Double
    let longitude: Double
    //let altitude: Double?
    
    enum EncodeCodingKeys: String, CodingKey {
        case lat, long
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodeCodingKeys.self)
        
        try container.encode(self.latitude, forKey: .lat)
        try container.encode(self.longitude, forKey: .long)
    }
}

// MARK: ItemGeo convenience initializers and mutators

extension ItemGeo {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ItemGeo.self, from: data)
        self.init(
            main: me.main,
            geometry: me.geometry/*,
            attributes: me.attributes*/
        )
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GeoAttributes
class GeoAttributes: Codable {
    let attribute: Keyword

    init(attribute: Keyword) {
        self.attribute = attribute
    }
}

// MARK: GeoAttributes convenience initializers and mutators

extension GeoAttributes {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(GeoAttributes.self, from: data)
        self.init(attribute: me.attribute)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        attribute: Keyword? = nil
    ) -> GeoAttributes {
        return GeoAttributes(
            attribute: attribute ?? self.attribute
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Keyword: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Keyword.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Keyword"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Keywords
class Keywords: Codable {
    let keyword: Keyword

    init(keyword: Keyword) {
        self.keyword = keyword
    }
}

// MARK: Keywords convenience initializers and mutators

extension Keywords {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Keywords.self, from: data)
        self.init(keyword: me.keyword)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        keyword: Keyword? = nil
    ) -> Keywords {
        return Keywords(
            keyword: keyword ?? self.keyword
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Number: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Number.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Number"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum Source: String, Codable {
    case tourdata = "TOURDATA"
}

// MARK: - Subitems
class Subitems: Codable {
    let subitem: SubitemUnion

    init(subitem: SubitemUnion) {
        self.subitem = subitem
    }
}

// MARK: Subitems convenience initializers and mutators

extension Subitems {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Subitems.self, from: data)
        self.init(subitem: me.subitem)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        subitem: SubitemUnion? = nil
    ) -> Subitems {
        return Subitems(
            subitem: subitem ?? self.subitem
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum SubitemUnion: Codable {
    case purpleSubitem(PurpleSubitem)
    case subitemElementArray([SubitemElement])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([SubitemElement].self) {
            self = .subitemElementArray(x)
            return
        }
        if let x = try? container.decode(PurpleSubitem.self) {
            self = .purpleSubitem(x)
            return
        }
        throw DecodingError.typeMismatch(SubitemUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SubitemUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .purpleSubitem(let x):
            try container.encode(x)
        case .subitemElementArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - SubitemElement
class SubitemElement: Codable {
    let id: Int
    let title: String?
    let type: TypeEnum
    let geo: PurpleGeo
    let ref: Ref?
    let mediaObjects: [SubitemMediaObject]
    let texts: [TextContainer]?
    // let numbers: SubitemNumbers?

    enum CodingKeys: String, CodingKey {
        case id, title, type, geo, ref, texts
        case mediaObjects = "media_objects"
    }

    init(
        id: Int,
        title: String?,
        type: TypeEnum,
        geo: PurpleGeo,
        ref: Ref?,
        mediaObjects: [SubitemMediaObject],
        texts: [TextContainer]?
        //numbers: SubitemNumbers?
    ) {
        self.id = id
        self.title = title
        self.type = type
        self.geo = geo
        self.ref = ref
        self.mediaObjects = mediaObjects
        self.texts = texts
        //self.numbers = numbers
    }
}

// MARK: SubitemElement convenience initializers and mutators

extension SubitemElement {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(SubitemElement.self, from: data)
        self.init(
            id: me.id,
            title: me.title,
            type: me.type,
            geo: me.geo,
            ref: me.ref,
            mediaObjects: me.mediaObjects,
            texts: me.texts
            //numbers: me.numbers
        )
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PurpleGeo
class PurpleGeo: Codable {
    let main, geometry: String?

    init(main: String?, geometry: String?) {
        self.main = main
        self.geometry = geometry
    }
}

// MARK: PurpleGeo convenience initializers and mutators

extension PurpleGeo {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(PurpleGeo.self, from: data)
        self.init(main: me.main, geometry: me.geometry)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        main: String?? = nil,
        geometry: String?? = nil
    ) -> PurpleGeo {
        return PurpleGeo(
            main: main ?? self.main,
            geometry: geometry ?? self.geometry
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - SubitemMediaObjects
class SubitemMediaObject: Codable {
    //let mediaObject: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        //case mediaObject = "media_object"
        case url
    }

    /*
    init(mediaObject: String) {
        self.mediaObject = mediaObject
    }
    */
}

// MARK: - SubitemNumbers
class SubitemNumbers: Codable {
    let number: [Double]

    init(number: [Double]) {
        self.number = number
    }
}

// MARK: SubitemNumbers convenience initializers and mutators

extension SubitemNumbers {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(SubitemNumbers.self, from: data)
        self.init(number: me.number)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        number: [Double]? = nil
    ) -> SubitemNumbers {
        return SubitemNumbers(
            number: number ?? self.number
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Ref: String, Codable {
    case meineEmpfehlungen = "Meine Empfehlungen"
    case ortAnTour = "Ort an Tour"
    case tourenvarianten = "Tourenvarianten"
    case zugehörigeLoipe = "zugehörige Loipe"
}

enum TypeEnum: String, Codable {
    case city = "City"
    case gastro = "Gastro"
    case hotel = "Hotel"
    case poi = "POI"
    case segment = "Segment"
    case tour = "Tour"
}

// MARK: - PurpleSubitem
class PurpleSubitem: Codable {
    let id: Int
    let type: TypeEnum
    let geo: FluffyGeo
    let texts: [TextContainer]
    //let numbers: SubitemNumbers

    init(
        id: Int,
        type: TypeEnum,
        geo: FluffyGeo,
        texts: [TextContainer]
        //numbers: SubitemNumbers
    ) {
        self.id = id
        self.type = type
        self.geo = geo
        self.texts = texts
        //self.numbers = numbers
    }
}

// MARK: - FluffyGeo
class FluffyGeo: Codable {
    let geometry: String

    init(geometry: String) {
        self.geometry = geometry
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
