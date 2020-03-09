struct Spot: Codable, Identifiable {
    var id: Int
    var name: String
    var desctription: String
}

struct Results: Codable {
    var data: Spots
}

typealias Spots = [Spot]
