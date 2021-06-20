//
//  LoginService.swift
//  Macros
//
//  Created by Leonardo Durazo on 04/05/21.
//
import Combine
import Firebase

struct LoginServiceModel {
    var id: String
    var email: String
    var password: String
}

protocol LoginService {
    func invoke(email: String, password: String) -> Future<LoginServiceModel, Error>
}

class LoginServiceImp: LoginService {
    private var session: Auth

    init(session: Auth = .auth()) {
        self.session = session
    }

    func invoke(email: String, password: String) -> Future<LoginServiceModel, Error> {
        Future() { [unowned self] promise in
            session.signIn(withEmail: email, password: password) { (result, error) in
                guard let value = result, error == nil else {
                    promise(.failure(error!))
                    return
                }
                let user = value.user
                promise(.success(LoginServiceModel(id: user.uid,
                                                      email: email,
                                                      password: password)))
            }
        }

    }
}
