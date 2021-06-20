//
//  CreateUserUseCase.swift
//  Macros
//
//  Created by Leonardo Durazo on 19/06/21.
//

import Combine

protocol CreateUserUseCase {
    func invoke(_ account: Account.Request, _ profile: Profile.Request) -> AnyPublisher<String, MacroError>
}

final class CreateUserUseCaseImp {
    struct Dependencies {
        let createAccountService: CreateAccountService = CreateAccountServiceImp()
        let createProfileService: CreateProfileService = CreateProfileServiceImp()
    }

    let dependencies: Dependencies

    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }

}

extension CreateUserUseCaseImp: CreateUserUseCase {

    func invoke(_ account: Account.Request, _ profile: Profile.Request) -> AnyPublisher<String, MacroError> {
        return dependencies
            .createAccountService
            .invoke(account)
            .flatMap({ self.dependencies.createProfileService.invoke(id: $0, profile) })
            .eraseToAnyPublisher()
    }
}
