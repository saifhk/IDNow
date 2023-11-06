//
//  Repository.swift
//  IDNowTechTest
//
//  Created by user on 01/11/2023.
//

import Foundation
final class TreasureRepository {
    static let shared = TreasureRepository()
    private let treasureService = TreasureService.shared
    func fetchTreasure<T: Codable>() async throws -> T {
        let url = InfoPlistParser.getKey(forKey: "URL")
        return try await treasureService.fetchTreasure(from: URL(string: url)!)
    }
}
