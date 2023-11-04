//
//  IDNowTechTestSwiftUIApp.swift
//  IDNowTechTestSwiftUI
//
//  Created by user on 03/11/2023.
//

import SwiftUI

@main
struct IDNowTechTestSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TreasureViewFactory().createListView()
        }
    }
}

final class TreasureViewFactory {
    func createListView()-> some View{
        let service = TreasureService()
        let useCase = TreasureUseCase(service: service)
        let viewModel = TreasureViewModel(useCase: useCase)
        let view = TreasureView(treasureViewModel: viewModel)
        return view
    }
}
