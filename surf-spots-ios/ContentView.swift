import SwiftUI

struct ContentView: View {
    @ObservedObject var state: SpotsState = SpotsState()
    
    var body: some View {
        VStack() {
            SpotsList(spots: state.spots).onAppear(perform: loadData)

        }
    }
    
    func loadData() {
        state.loadSpots()
    }
}
