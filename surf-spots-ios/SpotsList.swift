import SwiftUI

struct SpotsList: View {
    var spots: Spots
    // swift structs give you an init as a var. auto-init thing.
    
    var body: some View {
        VStack() {
            ForEach(spots) { spot in
                Text(spot.name)
            }
        }
    }
}
