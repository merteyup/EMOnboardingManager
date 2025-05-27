//
//  SafeIndex.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 27.05.2025.
//

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
