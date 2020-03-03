import Combine

class SpotsState: ObservableObject {
    @Published var spots: Spots
    
    init() {
        self.spots = []
    }
    
    func loadSpots() {
        // call API!
    }
}

// HINT: URLSession.shared.dataTaskPublisher
// sink on the publisher - that'll actually run the publisher.
// call map on data task publisher and map from data type from server in to Spots - Codeable does this easily.
