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
          let decoder = JSONDecoder()
          
          if let data = data {
              do {
                 decoder.decode(Spots.self, from: data) {
                 DispatchQueue.main.async {
                     self.spots = decodedResponse
                 }
                 return
                }
              } catch let DecodingError.dataCorrupted(context) {
                  print(context)
              } catch let DecodingError.keyNotFound(key, context) {
                  print("Key '\(key)' not found:", context.debugDescription)
                  print("codingPath:", context.codingPath)
              } catch let DecodingError.valueNotFound(value, context) {
                  print("Value '\(value)' not found:", context.debugDescription)
                  print("codingPath:", context.codingPath)
              } catch let DecodingError.typeMismatch(type, context)  {
                  print("Type '\(type)' mismatch:", context.debugDescription)
                  print("codingPath:", context.codingPath)
              } catch {
                  print("error: ", error)
              }
        }
      }.resume()
    }
}

// HINT: URLSession.shared.dataTaskPublisher
// sink on the publisher - that'll actually run the publisher.
// call map on data task publisher and map from data type from server in to Spots - Codeable does this easily.
// https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui
