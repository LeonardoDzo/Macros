//
//  HomeView.swift
//  Macros
//
//  Created by Leonardo Durazo on 22/05/21.
//

import SwiftUI

struct HomeView: View {
    private let profile: ProfileViewModel

    var body: some View {
        TabView {
           UsersView()
            .tabItem {
                Image(systemName: "wallet.pass.fill")
                Text("Usuarios")
            }
           WODView()
            .tabItem {
                Image(systemName: "heart.text.square")
                Text("WOD")
            }
           ProfileView(profile: profile)
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Perfil")
            }
        }
        .background(Color.card)
        .accentColor(.mainTabBar)
    }

    init(profileModel: ProfileViewModel) {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground

        self.profile = profileModel
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(profileModel: .init())
    }
}
