//
//  AddUserView.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

struct AddUserView: View {
    var body: some View {
        VStack {
            Group {
                FieldView(placeholder: "First name")
                FieldView(placeholder: "Last name")
            }
            FieldView(placeholder: "Phone number",
                      keyboardType: .phonePad)

            Button("Add") {
                print(#function)
            }
        }.padding(.trailing)
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}

