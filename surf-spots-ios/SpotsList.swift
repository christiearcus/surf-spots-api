import SwiftUI

struct SpotsList: View {
    var spots: Spots
    
    var body: some View {
        VStack() {
            ForEach(spots) { spot in
                Text(spot.name)
            }
        }
    }
}
