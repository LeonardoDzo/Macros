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
    var goToHomeView: Bool { get set }
    var profile: ProfileViewModel? { get }
    var isLoginButonAvailable: Bool { get set }
    func login()
}

final class LoginViewModelImp: LoginViewModel {
    @Published var phone: String = "leo.durazod@gmail.com" {
        didSet {
            validate()
        }
    }
    @Published var password: String = "Leonardo94" {
        didSet {
            validate()
        }
    }
    @Published var goToHomeView: Bool = false
    @Published var isLoginButonAvailable: Bool = true
    var profile: ProfileViewModel?
    var cancellationToken: AnyCancellable?

    private let model: LoginModel

    init(model: LoginModel = LoginModelImp()) {
        self.model = model
    }

    func login() {
        cancellationToken = model.login(email: phone, password: password)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { model in
                self.profile = model
                self.goToHomeView = true
            })
    }

    private func validate() {
        isLoginButonAvailable = phone.count >= 10 && password.count >= 8
    }
}
