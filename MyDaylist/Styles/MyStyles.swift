//
//  MyStyles.swift
//  MyDaylist
//
//  Created by Andrew Wijaya on 14/07/2024.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
