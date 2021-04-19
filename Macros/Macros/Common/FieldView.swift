//
//  FieldView.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

struct FieldView: View {
    @State private var value: String = ""
    private var placeholder: String
    private var keyboardType: UIKeyboardType

    var body: some View {

        TextField(
            placeholder,
            text: $value
        )
        .autocapitalization(.none)
        .frame(height: 80.0)
        .disableAutocorrection(true)
        .padding(.horizontal)
        .keyboardType(keyboardType)

    }


    init(placeholder: String, keyboardType: UIKeyboardType = .default) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }

}
