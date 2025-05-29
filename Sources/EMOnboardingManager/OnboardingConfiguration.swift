//
//  OnboardingConfiguration.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

import SwiftUI

public struct OnboardingConfiguration {
    public let logoView: () -> AnyView
    public let colorPalette: OnboardingColorPalette
    public let questions: [OnboardingQuestion]
    public let onboardingDescriptions: [String]

    public init<Logo: View>(
        @ViewBuilder logoView: @escaping () -> Logo,
        colorPalette: OnboardingColorPalette,
        questions: [OnboardingQuestion],
        onboardingDescriptions: [String]
    ) {
        self.logoView = { AnyView(logoView()) }
        self.colorPalette = colorPalette
        self.questions = questions
        self.onboardingDescriptions = onboardingDescriptions
    }
}
