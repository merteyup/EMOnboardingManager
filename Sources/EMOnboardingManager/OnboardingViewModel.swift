//
//  OnboardingViewModel.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

import SwiftUI

public final class OnboardingViewModel: ObservableObject {
    public let configuration: OnboardingConfiguration
    public var onFinished: (([OnboardingAnswer]) -> Void)?
    @Published public var answers: [OnboardingAnswer] = []
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

    public func submitAnswer(_ value: AnyHashable) {
        guard let question = currentQuestion else { return }

        let answer = OnboardingAnswer(
            id: question.id,
            questionTitle: question.title,
            answerType: question.answerType,
            value: value
        )

        answers.append(answer)
        currentIndex += 1

        if isFinished {
            onFinished?(answers)
        }
    }

    public var isFinished: Bool {
        currentIndex >= configuration.questions.count
    }
}

public extension OnboardingViewModel {
    static func defaultModel(
        logoView: @escaping () -> some View,
        appTitle: String = "Welcome",
        colorPalette: OnboardingColorPalette = .init(
            accent: .blue,
            background: .white,
            text: .black,
            secondary: .gray
        ),
        questions: [OnboardingQuestion] = [],
        descriptions: [String] = []
    ) -> OnboardingViewModel {
        let config = OnboardingConfiguration.defaultConfiguration(
            logoView: logoView,
            appTitle: appTitle,
            colorPalette: colorPalette,
            questions: questions,
            descriptions: descriptions
        )
        return OnboardingViewModel(
            configuration: config
        )
    }
}
