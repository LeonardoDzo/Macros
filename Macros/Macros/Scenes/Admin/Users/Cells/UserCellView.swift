//
//  UserCellView.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

struct UserCellView: View {
    var user: UserViewModel

    var body: some View {
        HStack {
            Image(systemName: "square.fill")
                .foregroundColor(user.membershipStatus.color)

            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Text(user.phone)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer(minLength: 0)
            Divider()
            Text(user.membershipStatus.rawValue)
                .font(.subheadline)

        }
    }
}
