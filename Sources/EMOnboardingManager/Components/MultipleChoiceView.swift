//
//  MultipleChoiceView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 29.05.2025.
//

import SwiftUI

public struct MultipleChoiceView: View {
    let options: [String]
    let selected: (Int) -> Void
    
    @State private var selectedIndex: Int? = nil

    public var body: some View {
        VStack(spacing: Paddings.low) {
            ForEach(options.indices, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                    selected(index)
                }) {
                    HStack {
                        Image(systemName: selectedIndex == index ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(.primary)
                        Text(options[index])
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding(.vertical, 4)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MultipleChoiceView(
        options: [
            "Inner Strength",
            "Confidence",
            "Focus",
            "Relationships",
            "Letting Go",
            "Communication"
        ],
        selected: { index in
        }
    )
}
