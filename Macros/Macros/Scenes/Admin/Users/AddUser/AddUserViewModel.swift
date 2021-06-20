//
//  AddUserViewModel.swift
//  Macros
//
//  Created by Leonardo Durazo on 19/06/21.
//

import SwiftUI
import Combine

struct Account {
    struct Request: Encodable {
        // MARK: Properties
        var email: String
        var password: String
    }
}

struct ProfileModel {
    var phone: String
    var firstName: String
    var lastName: String
    var gender: String
}

protocol AddUserViewModel: ObservableObject {
    var account: Account.Request { get set }
    var profile: ProfileModel { get set }

    func createUserAccount()

}

final class AddUserViewModelImp: AddUserViewModel {
    @Published var account: Account.Request = .init(email: "", password: "")
    @Published var profile: ProfileModel = .init(phone: "0000000000", firstName: "", lastName: "", gender: "") {
        didSet {
            setPassword(from: "\(profile.phone)")
        }
    }
    private var cancellationToken: AnyCancellable?

    struct Dependencies {
        let createUserUseCase: CreateUserUseCase = CreateUserUseCaseImp()
    }

    let dependencies: Dependencies

    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }

    func createUserAccount() {
        cancellationToken = dependencies.createUserUseCase
            .invoke(account, Profile.Request(from: profile))
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { value in
                print(value)
            })
    }

    private func setPassword(from phone: String) {
        guard phone.count == 10 else {
            return
        }
        account.password = phone
    }
}
