//
//  Factory.swift
//  IDNowTechTest
//
//  Created by user on 01/11/2023.
//

import Foundation
import UIKit
class Factory {
    func createTreasureViewController() -> UIViewController {
        let vc = TreasureViewController()
        return vc
    }
}

struct LabelFactory {
    
    static func build(text : String? , font : UIFont, backgroundCOlor : UIColor = .clear , textColor : UIColor = ThemeColor.text, textAlignement : NSTextAlignment, numberOfLine : Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = backgroundCOlor
        label.textColor = textColor
        label.textAlignment = textAlignement
        label.numberOfLines = numberOfLine
        return label
    }
}
