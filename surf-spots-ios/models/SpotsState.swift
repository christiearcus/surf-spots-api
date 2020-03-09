import Combine
import SwiftUI

class SpotsState: ObservableObject {
    @Published var spots: Spots
    
    init() {
        self.spots = []
    }
    
    func loadSpots() {
        guard let url = URL(string: "https://christie-metson-surf-spots.herokuapp.com/api/spots.json") else {
            print("invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                // no decoded response...
                if let decodedResponse = try? JSONDecoder().decode(Results.self, from: data) {
                    DispatchQueue.main.async {
                        self.spots = decodedResponse.data
                    }
                    return
                }
            }
            print("there was a problem calling the API: \(error?.localizedDescription ?? "unkown error")")
        }.resume()
    }
}

// HINT: URLSession.shared.dataTaskPublisher
// sink on the publisher - that'll actually run the publisher.
// call map on data task publisher and map from data type from server in to Spots - Codeable does this easily.
// https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui
