//
//  LoginView.swift
//  Macros
//
//  Created by Leonardo Durazo on 18/04/21.
//

import SwiftUI

struct LoginView<ViewModel: LoginViewModel>: View {

    @EnvironmentObject var viewModel: ViewModel

    private let circleWidth = UIScreen.width * 1.5

    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {

                SemiCircle()
                    .fill(Color.main)
                    .padding(.top, -UIScreen.width * 1.2)

                Image("WhiteLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.width / 1.5)
                    .padding(.top, -UIScreen.width)

                VStack {

                    Text("Bienvenido")
                        .font(.largeTitle)
                        .bold()
                    Text("Inicia sesión para continuar")
                        .font(.footnote)


                    TextField("Email", text: $viewModel.phone)
                        .padding()
                        .background(Color.textField)
                        .cornerRadius(25.0)
                        .keyboardType(.phonePad)
                        .padding(.top)

                    SecureField("Contraseña", text: $viewModel.password)
                        .padding()
                        .background(Color.textField)
                        .cornerRadius(25.0)
                        .padding(.bottom)

                    Button(action: {
                        viewModel.login()
                    }, label: {
                        Text("Iniciar sesión")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.main)
                            .cornerRadius(25.0)

                    })
                    .disabled(!viewModel.isLoginButonAvailable)
                    .sheet(isPresented: $viewModel.goToHomeView, content: {
                        if let profile = viewModel.profile { HomeView(profileModel: profile)}

                    })
                }.padding(.horizontal)

            }
        }

    }
}

struct SemiCircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.size.width/2, y: 0), radius: rect.size.width * 1.5, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView<LoginViewModelImp>().environmentObject(LoginViewModelImp())
    }
}
