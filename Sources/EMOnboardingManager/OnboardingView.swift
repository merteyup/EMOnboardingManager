//
//  SwiftUIView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

import SwiftUI


public struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @State private var selectedCapsules: Set<String> = []
    @State private var textAnswer: String = ""
    @State private var scaleAnswer: Double = 0.0
    @State private var multipleAnswer: [String] = []

    public init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        if let question = viewModel.currentQuestion {
            VStack(spacing: 0) {
                header

                QuestionView(question: question.title)
                    .padding(.top, Paddings.mid)
                    .padding(.horizontal, Paddings.mid)

                answerInput(for: question)

                submitButton(for: question)
            }
            .background(viewModel.configuration.colorPalette.background)
        } else {
            Text("All done 🎉")
                .font(.title)
                .padding()
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: Paddings.low) {
            ProgressBarView(viewModel: viewModel)
                .padding(.top, Paddings.high)

            viewModel.configuration.logoView()
                .frame(width: 100, height: 100)
                .padding(.top, Paddings.extraHigh)

            Text(viewModel.configuration.appTitle)
                .font(.title2)
                .padding(.top, Paddings.mid)

            if let description = viewModel.onboardingDescriptions.randomElement() {
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.horizontal)
        .frame(maxHeight: .infinity, alignment: .top)
    }

    // MARK: - Answer Input

    private func answerInput(for question: OnboardingQuestion) -> some View {
        GeometryReader { geometry in
            VStack {
                Spacer(minLength: 0)

                VStack {
                    switch question.answerType {
                    case .singleChoice(let options):
                        SingleChoiceView(options: options) { selectedIndex in
                            viewModel.submitAnswer(selectedIndex)
                        }

                    case .multipleChoice(let options):
                        MultipleChoiceView(options: options) { selectedIndexes in
                            viewModel.submitAnswer(selectedIndexes)
                        }.padding(.leading, Paddings.extraHigh)

                    case .scale:
                        ScaleSliderView(range: 0...10, value: $scaleAnswer)

                    case .text:
                        TextInputView(answer: $textAnswer)
                    case .multipleChoiceCapsule(options: let options):
                        MultipleChoiceCapsuleView(selectedItems: $selectedCapsules,
                                                  allItems: options
                        )
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: geometry.size.height * 0.75)
                .offset(y: geometry.size.height * 0.15)
                .padding(.bottom, 80)
            }
        }
    }

    // MARK: - Submit Button

    private func submitButton(for question: OnboardingQuestion) -> some View {
        Button {
            switch question.answerType {
            case .text:
                viewModel.submitAnswer(textAnswer)
            case .scale:
                viewModel.submitAnswer(scaleAnswer)
            case .singleChoice, .multipleChoice:
                // These are submitted from within the answer views.
                break
            case .multipleChoiceCapsule:
                print("SelectedItems: \(selectedCapsules)")
                viewModel.submitAnswer(selectedCapsules)
            }
        } label: {
            Image(systemName: "arrowshape.forward.fill")
                .font(.system(size: 32))
                .tint(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, Paddings.extraHigh)
        .padding(.bottom, Paddings.extraHigh)
    }
}


#Preview {
    OnboardingView(viewModel: OnboardingViewModel(configuration: OnboardingConfiguration.mockConfig))
}
