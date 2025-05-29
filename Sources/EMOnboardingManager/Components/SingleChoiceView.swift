//
//  SingleChoiceView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 29.05.2025.
//

import SwiftUI

public struct SingleChoiceView: View {
    let options: [String]
    let selected: (Int) -> Void
    
    @State private var selectedIndex: Int? = nil

    public var body: some View {
        HStack(spacing: Paddings.high){
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
                    }
                    .padding(.vertical, 4)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}
