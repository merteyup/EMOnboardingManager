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
            }.padding(.horizontal, Paddings.high)

            Slider(value: $value, in: range, step: 1)
                .padding(.horizontal, Paddings.high)
                .tint(.primary)
                
            
            Text("Selected: \(Int(value))")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

#Preview {
    @State var value = 3.0
    ScaleSliderView(range: 0...10, value: $value)
}
