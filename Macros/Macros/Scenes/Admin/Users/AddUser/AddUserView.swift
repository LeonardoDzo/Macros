//
//  AddUserView.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

struct AddUserView<ViewModel: AddUserViewModel>: View {

    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Color.main.edgesIgnoringSafeArea(.all)
            Group {
                FieldView(value: $viewModel.account.email, placeholder: "Email")
            }
            Group {
                FieldView(value: $viewModel.profile.firstName, placeholder: "First name")
                FieldView(value: $viewModel.profile.lastName, placeholder: "Last name")
            }
            Group {
                FieldView(value: $viewModel.profile.phone, placeholder: "Phone number",
                      keyboardType: .phonePad)
                FieldView(value: $viewModel.profile.gender, placeholder: "Gender")
            }

            Button("Add") {
                viewModel.createUserAccount()
            }
        }.padding(.horizontal)
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView<AddUserViewModelImp>().environmentObject(AddUserViewModelImp())
    }
}

