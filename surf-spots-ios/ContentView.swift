//
//  ContentView.swift
//  surf-spots-ios
//
//  Created by Christie Metson on 18/1/20.
//  Copyright © 2020 Christie Metson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Surf Spots")
                .font(.largeTitle)
                .foregroundColor(.pink)

            HStack {
                Text("Journal about all of your memorable surf spots and remember them forever")
                Spacer()
                Text("Join for free")
                    .foregroundColor(.gray)
                
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
