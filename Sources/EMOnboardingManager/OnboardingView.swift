//
//  SwiftUIView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

import SwiftUI

struct Paddings {
    static let low: CGFloat = 12
    static let mid: CGFloat = 18
    static let high: CGFloat = 24
    static let extraHigh: CGFloat = 32
    static let extraExtraHigh: CGFloat = 48
}

public struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @State private var textAnswer: String = ""
    @State private var scaleAnswer: Double = 0.0
   

    public init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        if let question = viewModel.currentQuestion {
            
            VStack {
                ProgressView(value: 0.3, total: 1.0)
                
                // TODO: Add logo in here
                viewModel.configuration.logoView()
                    .frame(width: 100, height: 100)
                    .padding(.top, Paddings.extraHigh)
                
                Text("Welcome to Lumora")
                    .padding()
                // TODO: This text should animated slowly
                Text(viewModel.onboardingDescriptions.randomElement() ?? "")
                
                
                QuestionView(question: question.title)
                    .padding(.top, Paddings.extraExtraHigh)
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
            
            
            
            VStack {
                switch question.answerType {
                case .singleChoice(let options):
                    
                    SingleChoiceView(options: options) { selectedIndex in
                        print("User selected option at index:", selectedIndex)
                        viewModel.submitAnswer(selectedIndex)
                    }.frame(maxWidth: .infinity, alignment: .top)
                    
                    
                case .multipleChoice(options: let options):
                    MultipleChoiceView()
                    
                case .scale:
                    ScaleSliderView(range: 0...10,
                                    value: $scaleAnswer)
                    .padding(.bottom, 100)

                case .text:
                    TextInputView(answer: $textAnswer)
                        .padding(.bottom, 100)
                }
            }
            
            
            Button {
                viewModel.submitAnswer(textAnswer)
            } label: {
                Image(systemName: "arrowshape.forward.fill")
                    .font(.system(size: 32))
            }.frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, Paddings.extraHigh)

        } else {
            Text("All done 🎉")
        }
    }
}

public struct QuestionView: View {
    var question: String
    var detail: String?
    
    public var body: some View {
        Text(question)
        if let detail = detail {
            Text(detail)
        }
    }
}

public struct SingleChoiceView: View {
    let options: [String]
    let selected: (Int) -> Void
    
    @State private var selectedIndex: Int? = nil

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(options.indices, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                    selected(index)
                }) {
                    HStack {
                        Image(systemName: selectedIndex == index ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(.accentColor)
                        Text(options[index])
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 4)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}


public struct ScaleSliderView: View {
    let range: ClosedRange<Double>
    @Binding var value: Double
    
    public init(range: ClosedRange<Double>, value: Binding<Double>) {
        self.range = range
        self._value = value
    }

    public var body: some View {
        VStack(spacing: Paddings.mid) {
            HStack {
                ForEach(Int(range.lowerBound)...Int(range.upperBound), id: \.self) { tick in
                    Text("\(tick)")
                        .font(.caption2)
                        .frame(maxWidth: .infinity)
                }
            }
            Slider(value: $value, in: range, step: 1)
            
            Text("Selected: \(Int(value))")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}



public struct TextInputView: View {
    @Binding var answer: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Paddings.low) {
            Text("Write your thoughts...")
                .font(.headline)

            TextEditor(text: $answer)
                .padding()
                .frame(minHeight: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
        .padding()
    }
}

public struct MultipleChoiceView: View {
    public var body: some View {
        Text("Multiple Choice View")
    }
}


#Preview {
    OnboardingView(viewModel: OnboardingViewModel(configuration: OnboardingConfiguration.mockConfig))
}
