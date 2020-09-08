//
//  Login.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct Login: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @ObservedObject var api: HeadhuntrAPI = HeadhuntrAPI.shared
    
    var body: some View {
        
        ZStack {
            LoginBackground()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                Text(api.errorMessage ?? " ")
                    .font(.caption)
                    .foregroundColor(.red)
                
                TextField("Username", text: $username)
                    .frame(maxWidth: 150)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 150)
                
                Button(action: {
                    self.api.login(username: self.username, password: self.password)
                }) {
                    Text("Login")
                }.padding()
                    .aspectRatio(1.0, contentMode: .fill)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .clipShape(Circle())
            }.padding()
                .background(Color.white)
        }
    }
}

struct LoginBackground: View {
    
    var body: some View {
    
        VStack {
            Color.BrandBlue
            Color.BrandOrange
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
