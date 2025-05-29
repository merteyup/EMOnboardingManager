//
//  ProgressBarView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 29.05.2025.
//

import SwiftUI

public struct ProgressBarView: View {
    
    @ObservedObject var viewModel: OnboardingViewModel

    public var body: some View {
        let totalQuestions = max(1, viewModel.configuration.questions.count)
        let currentProgress = Double(viewModel.currentIndex + 1)

        ProgressView(value: currentProgress, total: Double(totalQuestions))
            .animation(.easeInOut, value: currentProgress)
    }
}
