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
                getTreasure(treasure: treasure)
            case .loadError(let error):
                Text("Error: \(error)")
            }
            Button(action: {
                           viewModel.fetchTreasure()
                       }) {
                           Text("Fetch Data")
                               .padding()
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
        }
    }
    
    @ViewBuilder
    func getTreasure(treasure : TreasureResponse) -> some View {
        ZStack {
            VStack {
                Text(treasure.message)
                HStack {
                    Image(treasure.type)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.9)
                        }
                Text(treasure.type)
            }
        }
    }
}


