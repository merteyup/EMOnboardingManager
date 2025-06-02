//
//  OnboardingConfiguration.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

import SwiftUI

public struct OnboardingConfiguration {
    public let logoView: () -> AnyView
    public let appTitle: String
    public let colorPalette: OnboardingColorPalette
    public let questions: [OnboardingQuestion]
    public let onboardingDescriptions: [String]

    public init<Logo: View>(
        @ViewBuilder logoView: @escaping () -> Logo,
        appTitle: String,
        colorPalette: OnboardingColorPalette,
        questions: [OnboardingQuestion],
        onboardingDescriptions: [String]
    ) {
        self.logoView = { AnyView(logoView()) }
        self.appTitle = appTitle
        self.colorPalette = colorPalette
        self.questions = questions
        self.onboardingDescriptions = onboardingDescriptions
    }
    
    
    public static var mockConfig: OnboardingConfiguration {
        OnboardingConfiguration(
            logoView: {
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.green)
            },
            appTitle: "Welcome to YourAppName",
            colorPalette: OnboardingColorPalette(
                accent: Color(hex: "7F8CAA"),
                background: Color(hex: "EAEFEF"),
                text: Color(hex: "333446"),
                secondary: Color(hex: "B8CFCE")
            ),
            questions: [
                OnboardingQuestion(
                    title: "What emotions do you experience the most lately?",
                    answerType: .multipleChoiceCapsule(options: ["Emptiness", "Confusion", "Sadness", "Anger", "Anxiety", "Joy", "Gratitude"])
                ),
                OnboardingQuestion(
                    title: "Are you having difficulties to say no?",
                    answerType: .singleChoice(options: ["Yes", "No", "Sometimes"])
                ),
                OnboardingQuestion(
                    title: "How overwhelmed do you feel lately?",
                    answerType: .scale
                ),
                OnboardingQuestion(
                    title: "Write one thought you keep returning to.",
                    answerType: .text
                )
            ],
            onboardingDescriptions: [
                "You are not your thoughts.",
                "Breathe. Write. Reflect.",
                "This is your space now."
            ]
        )
    }
}

