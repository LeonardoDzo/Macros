//
//  UsersView.swift
//  Macros
//
//  Created by Leonardo Durazo on 16/04/21.
//

import SwiftUI

struct UsersView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var selectedView = 1

    var users = [UserViewModel]()

    var body: some View {
        NavigationView {
            ZStack {
                Color.main.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        SearchBar(text: $searchText)
                        if showCancelButton  {
                            Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                            }
                            .foregroundColor(Color(.systemBlue))
                        }
                    }
                    Spacer()
                    List {
                        ForEach(users.filter(searchUser).sorted(by: { $0.membershipStatus.priority < $1.membershipStatus.priority })) { (user) in
                            UserCellView(user: user)
                        }
                    }
                }
            }
            .navigationBarTitle("Usuarios", displayMode: .large)
            .navigationBarItems(
                trailing: Image(systemName: "person.2.square.stack.fill")
            ).navigationBarHidden(showCancelButton)
        }
    }

    init(users: [UserViewModel] = .init(repeating: .random, count: 15)) {
        self.users = users
    }
}

extension UsersView {
    private func searchUser(_ user: UserViewModel) -> Bool {
        guard !searchText.isEmpty else {
            return true
        }
        return user.name.contains(searchText) || user.phone.hasPrefix(searchText)
    }
}
