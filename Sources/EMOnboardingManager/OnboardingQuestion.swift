//
//  OnboardingModel.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

import SwiftUI

public enum OnboardingAnswerType: Hashable {
    case singleChoice(options: [String])
    case multipleChoice(options: [String])
    case multipleChoiceCapsule(options: [String])
    case scale
    case text
}

public struct OnboardingQuestion: Identifiable, Hashable {
    public let id: UUID
    public let title: String
    public let subtitle: String?
    public let answerType: OnboardingAnswerType

    public init(id: UUID = UUID(),
                title: String,
                subtitle: String? = nil,
                answerType: OnboardingAnswerType) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.answerType = answerType
    }
    
    public static func == (lhs: OnboardingQuestion, rhs: OnboardingQuestion) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
