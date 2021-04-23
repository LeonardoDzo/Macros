//
//  ProfileView.swift
//  Macros
//
//  Created by Leonardo Durazo on 20/04/21.
//

import SwiftUI

struct ProfileViewModel {
    var firstName: String = "Leonardo"
    var lastName: String = "Durazo Duran"
    var phone: String = "6623442817"
    var membershipStatus: MembershipStatus = .active
    var paidDay: String = "Lunes, 10 de Mayo"

    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct ProfileView: View {
    var profile: ProfileViewModel

    var body: some View {
        NavigationView {
            ZStack {
                SemiCircle()
                    .fill(Color.main)
                    .padding(.top, -UIScreen.width * 1.2)

                VStack(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(Color.card)
                        .frame(height: 180)
                        .shadow(radius: 10)

                        VStack(alignment: .leading) {
                            Text(profile.fullName)
                                .font(.title)
                                .bold()
                            Text("Nombre")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color.gray)
                            Divider()
                            Text(profile.phone)
                                .font(.title)
                                .bold()
                            Text("Phone")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color.gray)
                        }.padding(.horizontal)
                    }.padding(.top, 30)



                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                         .fill(Color.card)
                        .frame(height: 180)
                        .shadow(radius: 10)

                        VStack(alignment: .leading) {
                            if profile.membershipStatus != .canceled {

                                Text(profile.paidDay.capitalized)
                                    .font(.title)
                                    .bold()
                                Text("Próximo pago")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(Color.gray)
                            }
                            Divider()
                            Text(profile.membershipStatus.rawValue.capitalized)
                                .font(.title)
                                .bold()
                            Text("Membresía")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color.gray)
                        }.padding(.horizontal)
                    }.padding(.top, 30)


                    Spacer()
                }.padding(.horizontal)
                .navigationTitle("Perfil")
            }

        }

    }

    init(profile: ProfileViewModel = .init()) {
        self.profile = profile
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
