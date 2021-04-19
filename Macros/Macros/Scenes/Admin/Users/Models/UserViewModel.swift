//
//  UserViewModel.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

struct UserViewModel: Identifiable {

    var id: String {
        phone
    }

    var name: String
    var phone: String
    var image = Image(systemName: "person.crop.circle.fill")
    var membershipStatus = MembershipStatus.active

    static var random: UserViewModel {
        UserViewModel(name: ["Leo Durazo", "Karina Durazo Karina Durazo Karina Durazo Karina Durazo","Maria Torres", "Jose Sisneros", "Myriam Durazo"].randomElement()!, phone: String(Int.random(in: 1111111111...9999999999)), membershipStatus: .random)
    }
}
