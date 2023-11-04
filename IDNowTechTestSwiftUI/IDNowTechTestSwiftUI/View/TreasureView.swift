//
//  ContentView.swift
//  IDNowTechTestSwiftUI
//
//  Created by user on 03/11/2023.
//

import SwiftUI

struct TreasureView: View {
    @ObservedObject private var viewModel: TreasureViewModel
    init(treasureViewModel: TreasureViewModel) {
        self.viewModel = treasureViewModel
    }
    var body: some View {
        VStack {
            switch viewModel.state {
            case .initial:
                Text("Tap the button to fetch data.")
            case .loading:
                Text("Loading...")
            case .loaded(let treasure):
                Text("Message: \(treasure.message)")
                Text("Type: \(treasure.type)")
            case .loadError(let error):
                Text("Error: \(error)")
            }
            Button("Fetch Data") {
                viewModel.fetchTreasure()
            }
        }
    }
}


