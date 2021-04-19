//
//  ResignKeyboardOnDragGesture.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
