//
//  AppTheme.swift
//  StarWarsSad
//
//  Created by Pilar García on 3/4/23.
//

import Foundation
import SwiftUI

struct Typography {
    var title1: Font
    var title2: Font
    var title3: Font
    var body1: Font
    var body2: Font
    var subtitle1: Font
    var subtitle2: Font
}

struct Colors {
    var accent: Color
    var text: Color
    var strokeDark: Color
    var strokeLight: Color
    var background1: Color
    var background2: Color
    var background3: Color
    var background4: Color
    var background5: Color
    var background6: Color
}

struct Shapes {
    var largeCornerRadius: CGFloat
    var bigCornerRadius: CGFloat
    var mediumCornerRadius: CGFloat
    var smallCornerRadius: CGFloat
}

struct Theme {
    
    static let colors: Colors = Colors(
        accent: Color("accent"),
        text: Color("text"),
        strokeDark: Color("strokeDark"),
        strokeLight: Color("strokeLight"),
        background1: Color("background1"),
        background2: Color("background2"),
        background3: Color("background3"),
        background4: Color("background4"),
        background5: Color("background5"),
        background6: Color("background6")
    )
    
    static let shapes: Shapes = Shapes(
        largeCornerRadius: 20,
        bigCornerRadius: 16,
        mediumCornerRadius: 10,
        smallCornerRadius: 4
    )
    
    static let typography: Typography = Typography(
        title1: Font.system(size: UIFontMetrics.default.scaledValue(for: 28), weight: .medium),
        title2: Font.system(size: UIFontMetrics.default.scaledValue(for: 24), weight: .medium),
        title3: Font.system(size: UIFontMetrics.default.scaledValue(for: 20), weight: .medium),
        body1: Font.system(size: UIFontMetrics.default.scaledValue(for: 18), weight: .regular),
        body2: Font.system(size: UIFontMetrics.default.scaledValue(for: 18), weight: .medium),
        subtitle1: Font.system(size: UIFontMetrics.default.scaledValue(for: 16), weight: .regular),
        subtitle2: Font.system(size: UIFontMetrics.default.scaledValue(for: 16), weight: .bold)
    )
}
