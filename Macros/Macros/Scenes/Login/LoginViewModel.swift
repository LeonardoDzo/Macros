//
//  LoginViewModel.swift
//  Macros
//
//  Created by Leonardo Durazo on 22/04/21.
//

import SwiftUI
import Combine

protocol LoginViewModel: ObservableObject {
    var phone: String { get set }
    var password: String { get set }
    var goToAdmin: Bool { get set }
    var isLoginButonAvailable: Bool { get set }
    func login() 
}

final class LoginViewModelImp: LoginViewModel {
    @Published var phone: String = "" {
        didSet {
            validate()
        }
    }
    @Published var password: String = "" {
        didSet {
            validate()
        }
    }
    @Published var goToAdmin: Bool = false
    @Published var isLoginButonAvailable: Bool = false

    private let model: LoginModel

    init(model: LoginModel = LoginModelImp()) {
        self.model = model
    }

    func login() {
        model.login(email: phone, password: password)
    }

    private func validate() {
        isLoginButonAvailable = phone.count >= 10 && password.count >= 8
    }
}
