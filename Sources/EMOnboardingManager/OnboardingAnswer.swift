//
//  OnboardingAnswer.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 5.06.2025.
//

import SwiftUI

public struct OnboardingAnswer: Identifiable, Hashable {
    public let id: UUID // same as question.id
    public let questionTitle: String
    public let answerType: OnboardingAnswerType
    public let value: AnyHashable

    public init(
        id: UUID,
        questionTitle: String,
        answerType: OnboardingAnswerType,
        value: AnyHashable
    ) {
        self.id = id
        self.questionTitle = questionTitle
        self.answerType = answerType
        self.value = value
    }
}
