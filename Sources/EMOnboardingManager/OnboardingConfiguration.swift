//
//  OnboardingConfiguration.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//


import SwiftUI

public struct OnboardingConfiguration {
    public let logoView: () -> AnyView
    public let accentColor: Color
    public let backgroundColor: Color
    public let textColor: Color
    public let secondaryColor: Color
    public let questions: [OnboardingQuestion]
    public let onboardingDescriptions: [String]

    public init<Logo: View>(
        @ViewBuilder logoView: @escaping () -> Logo,
        accentColor: Color,
        backgroundColor: Color,
        textColor: Color,
        secondaryColor: Color,
        questions: [OnboardingQuestion],
        onboardingDescriptions: [String]
    ) {
        self.logoView = { AnyView(logoView()) }
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.secondaryColor = secondaryColor
        self.questions = questions
        self.onboardingDescriptions = onboardingDescriptions
    }
}
