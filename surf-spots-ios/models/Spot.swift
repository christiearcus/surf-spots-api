struct Spot: Codable, Identifiable {
    var id: Int
    var name: String
    var desctription: String
}

typealias Spots = [Spot]
