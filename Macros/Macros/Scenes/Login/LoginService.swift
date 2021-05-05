//
//  LoginService.swift
//  Macros
//
//  Created by Leonardo Durazo on 04/05/21.
//
import Firebase

typealias LoginServiceModel = (id: String,
                               email: String,
                               password: String)

protocol LoginService {
    func invoke(email: String, password: String, completion: @escaping (Result<LoginServiceModel, Error>) -> Void)
}

class LoginServiceImp: LoginService {
    private var session: Auth

    init(session: Auth = .auth()) {
        self.session = session
    }

    func invoke(email: String, password: String, completion: @escaping (Result<LoginServiceModel, Error>) -> Void) {
        session.signIn(withEmail: email, password: password) { (result, error) in

            guard let value = result, error == nil else {
                completion(.failure(error!))
                return
            }
            let user = value.user
            completion(.success(LoginServiceModel(id: user.uid,
                                                  email: email,
                                                  password: password)))
        }
    }
}
