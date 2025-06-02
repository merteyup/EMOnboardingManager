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
    
    var body: some View {
        CapsulePickerView(
            items: allItems,
            selectedItems: $selectedItems
        )
    }
}

#Preview {
    @State var selectedItems: Set<String> = [
        "El1",
        "Element 2"
    ]
    
    let allItems: [String] = [
        "El1",
        "Element 2",
        "Element 3",
        "Element 4",
        "El5",
        "El 6"
    ]
    
    MultipleChoiceCapsuleView(
        selectedItems: $selectedItems,
                              allItems: allItems
    )
}
