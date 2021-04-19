//
//  View+Extension.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

