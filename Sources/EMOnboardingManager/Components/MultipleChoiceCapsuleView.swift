//
//  SwiftUIView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 31.05.2025.
//

import SwiftUI

struct MultipleChoiceCapsuleView: View {
    @Binding var selectedItems: Set<String>
    let allItems: [String]
    
    let columns = [
        GridItem(.adaptive(minimum: 80), spacing: 8)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading) {
            ForEach(allItems, id: \.self) { item in
                Text(item)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(selectedItems.contains(item) ? Color.blue : Color.gray.opacity(0.2))
                    )
                    .foregroundColor(selectedItems.contains(item) ? .white : .primary)
                    .onTapGesture {
                        if selectedItems.contains(item) {
                            selectedItems.remove(item)
                        } else {
                            selectedItems.insert(item)
                        }
                    }
            }
        }
        .padding()
    }
}

#Preview {
    @State var selectedItems: Set<String> = ["El1", "Element 2"]

    let allItems: [String] = ["El1", "Element 2", "Element 3", "Element 4", "El5", "El 6"]


    MultipleChoiceCapsuleView(selectedItems: $selectedItems,
                           allItems: allItems)
}
