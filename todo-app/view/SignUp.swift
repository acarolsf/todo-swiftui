//
//  SignUp.swift
//  todo-app
//
//  Created by Ana Carolina on 04/02/21.
//

import SwiftUI

struct SignUp: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("Email")
                    TextField("Enter a email address", text: $email)
                }
                .padding()
                
                HStack {
                    Text("Password")
                    SecureField("Enter a password", text: $password)
                }
                .padding()
                
                Button(action: signup) {
                    Text("Sign Up")
                }
            }
        }
    }
    
    func signup() {
       if !email.isEmpty && !password.isEmpty {
           session.signUp(email: email, password: password) { (result, error) in
               if (error != nil) {
                   print("Error")
               } else {
                   self.email = ""
                   self.password = ""
               }
           }
       }
   }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
