//
//  CreateAccountService.swift
//  Macros
//
//  Created by Leonardo Durazo on 19/06/21.
//

import Firebase
import Combine

protocol CreateAccountService {
    func invoke(_ model: Account.Request) -> Future<String, MacroError>
}

final class CreateAccountServiceImp {
    private var session: Auth

    init(session: Auth = .auth()) {
        self.session = session
    }
}

extension CreateAccountServiceImp: CreateAccountService {
    func invoke(_ model: Account.Request) -> Future<String, MacroError> {
        return Future() { promise in
            self.session.createUser(withEmail: model.email, password: model.password) { result, error in
                guard error == nil else {
                    promise(.failure(.custom(error: error!)))
                    return
                }

                guard let result = result else {
                    promise(.failure(.noData))
                    return
                }
                promise(.success(result.user.uid))
            }
        }
    }
}
