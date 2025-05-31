//
//  TextInputView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 29.05.2025.
//

import SwiftUI

public struct TextInputView: View {
    @Binding var answer: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Paddings.low) {
            Text("Write your thoughts...")
                .font(.headline)

            TextEditor(text: $answer)
                .padding()
                .frame(minHeight: 150)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )

        }
        .padding()
    }
}


#Preview {
    @State var answer = "Being alive is a gift"
    TextInputView(answer: $answer)
}
