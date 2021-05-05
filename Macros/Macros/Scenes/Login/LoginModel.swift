//
//  LoginModel.swift
//  Macros
//
//  Created by Leonardo Durazo on 22/04/21.
//
import Firebase
import Combine

protocol LoginModel {
    func login(email: String, password: String)
}

final class LoginModelImp: LoginModel {
    let service: LoginService

    init(service: LoginService = LoginServiceImp()) {
        self.service = service
    }

    func login(email: String, password: String) {
        service.invoke(email: email, password: password) { (result) in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

