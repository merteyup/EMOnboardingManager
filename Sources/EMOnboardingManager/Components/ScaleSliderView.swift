//
//  ScaleSliderView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 29.05.2025.
//

import SwiftUI

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
