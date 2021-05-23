//
//  LoginModel.swift
//  Macros
//
//  Created by Leonardo Durazo on 22/04/21.
//
import Firebase
import Combine

enum LoginError {
    case aut
}

protocol LoginModel {
    func login(email: String, password: String) -> AnyPublisher<ProfileViewModel, Error>
}

final class LoginModelImp: LoginModel {
    let loginService: LoginService
    let getProfileService: GetProfileService

    init(loginService: LoginService = LoginServiceImp(),
         getProfileService: GetProfileService = GetProfileServiceImp()) {
        self.loginService = loginService
        self.getProfileService = getProfileService
    }

    func login(email: String, password: String) -> AnyPublisher<ProfileViewModel, Error> {
        self.loginService.invoke(email: email, password: password)
            .flatMap { loginModel in
                return self.getProfileService.invoke(uid: loginModel.id).map { response in
                    var response = response
                    response.email = email
                    response.id = loginModel.id
                    return ProfileViewModel(from: response)
                }
            }.eraseToAnyPublisher()
    }
}

