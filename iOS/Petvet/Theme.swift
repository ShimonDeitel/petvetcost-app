import SwiftUI

enum Theme {
    static let accent = Color(red: 0.85,0.47,0.18)
    static let accent2 = Color(red: 0.30,0.60,0.55)
    static let background = Color(red: 0.08,0.06,0.04)

    static let largeTitle = Font.system(.largeTitle, design: .serif).weight(.bold)
    static let headline = Font.system(.headline, design: .rounded)
    static let body = Font.system(.body, design: .default)
    static let caption = Font.system(.caption, design: .rounded)

    static let cornerRadius: CGFloat = 14
}
