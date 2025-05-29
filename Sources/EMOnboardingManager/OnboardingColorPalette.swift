//
//  File.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 29.05.2025.
//

import SwiftUI

public struct OnboardingColorPalette {
    public let accent: Color
    public let background: Color
    public let text: Color
    public let secondary: Color

    public init(accent: Color, background: Color, text: Color, secondary: Color) {
        self.accent = accent
        self.background = background
        self.text = text
        self.secondary = secondary
    }
}
