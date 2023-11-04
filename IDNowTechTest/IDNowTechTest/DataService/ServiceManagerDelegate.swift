//
//  DataServiceDelegate.swift
//  IDNowTechTest
//
//  Created by user on 01/11/2023.
//

import Foundation
import Combine
protocol DataServiceDelegate{
    func fetchTreasure<T:Codable>(from endpoint : URL) async throws ->  T
}
