//
//  LoginView.swift
//  todo-app
//
//  Created by Ana Carolina on 04/02/21.
//

import SwiftUI
import UIKit

struct LoginView: View {
    // - MARK: Properties
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
            VStack(spacing: 20) {
                Text("Entrar").font(.system(size: 25))
               
                HStack {
                    Image(systemName: "at").foregroundColor(.gray).padding()
                    TextField("Email", text: $email).padding(5)
                        
                }
                .padding(2)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1.5))
                
                HStack {
                    Image(systemName: "lock").foregroundColor(.gray).padding()
                    SecureField("Senha", text: $password).padding(5)
                        
                }
                .padding(2)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1.5))
                
                Button(action: login) {
                    Text("Entrar")
                }
                .frame(width: 300, height: 20, alignment: .center)
                .foregroundColor(.white)
                .padding(.all)
                .background(Color.blue)
                .cornerRadius(16)
                
                NavigationLink(destination: SignUp()) {
                    Text("Cadastrar").foregroundColor(.blue)
                }
            }
            .padding()
        
    }
    
    // - MARK: Functions
    func login() {
        session.logIn(email: email, password: password) { (result, error) in
            if (error != nil) {
                print("Error")
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
