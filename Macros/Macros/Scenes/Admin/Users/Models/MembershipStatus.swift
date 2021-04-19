//
//  MembershipStatus.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

enum MembershipStatus: String, CaseIterable {
    case active
    case expired
    case canceled

    var color: Color {
        switch self {
        case .active:
            return .green
        case .canceled:
            return .black
        case .expired:
            return .yellow
        }
    }

    var priority: Int {
        switch self {
        case .active:
            return 0
        case .expired:
            return 1
        case .canceled:
            return 2
        }
    }

    static var random: MembershipStatus {
        allCases.randomElement()!
    }
}
