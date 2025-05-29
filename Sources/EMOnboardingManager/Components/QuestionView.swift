//
//  QuestionView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 29.05.2025.
//

import SwiftUI

public struct QuestionView: View {
    var question: String
    var detail: String?
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            if let detail = detail {
                Text(detail)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.horizontal)
    }
}
