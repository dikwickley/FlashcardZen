//
//  Color+Extensions.swift
//  FlashcardZen
//
//  Created by Aniket Rawat on 29/03/23.
//

import Foundation
import SwiftUI

enum AssetsColor {
    case bg
    case text
    case card
    case offblack
    case offwhite
}

extension Color {
    static func app(_ name: AssetsColor) -> Color {
        switch name {
        case .bg: return Color(uiColor: UIColor(named: "bg") ?? UIColor(.yellow))
        case .text: return Color(uiColor: UIColor(named: "text") ?? UIColor(.yellow))
        case .card: return Color(uiColor: UIColor(named: "card") ?? UIColor(.yellow))
        case .offblack: return Color(uiColor: UIColor(named: "offblack") ?? UIColor(.yellow))
        case .offwhite: return Color(uiColor: UIColor(named: "offwhite") ?? UIColor(.yellow))
        }
    }
}
