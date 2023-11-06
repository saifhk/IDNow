//
//  Constants.swift
//  IDNowTechTestSwiftUI
//
//  Created by user on 04/11/2023.
//

import Foundation

class Constants {
    static var shared = Constants()
    var url : URL {
        // swiftlint:disable:next force_unwrapping
      urlComponent.url!
  }
  private var urlComponent : URLComponents{
      var components = URLComponents()
      components.scheme = "http"
      components.host = "localhost"
      components.port = 3000
      components.path = "/startHunt"
      return components
  }
}
