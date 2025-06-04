//
//  Untitlaed.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

import SwiftUI

public final class OnboardingViewModel: ObservableObject {
    public let configuration: OnboardingConfiguration
    @Published public var answers: [UUID: Any] = [:]
    @Published public var currentIndex: Int = 0

    public init(configuration: OnboardingConfiguration) {
        self.configuration = configuration
    }

    public var currentQuestion: OnboardingQuestion? {
        configuration.questions[safe: currentIndex]
    }

    public var onboardingDescriptions: [String] {
        configuration.onboardingDescriptions
    }

    public func submitAnswer(_ answer: Any) {
        guard let question = currentQuestion else { return }
        answers[question.id] = [question: answer]
        currentIndex += 1
    }

    public var isFinished: Bool {
        currentIndex >= configuration.questions.count
    }
}
