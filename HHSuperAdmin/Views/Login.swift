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

            VStack {
                
                Text("headhuntr.io")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.BrandOrange)
                    .padding()
                
                VStack(alignment: .center) {
                    
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(.BrandBlue)
                    
                    Divider()
                    
                    Text(api.errorMessage ?? " ")
                        .font(.caption)
                        .foregroundColor(.red)
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        self.api.login(username: self.username, password: self.password)
                    }) {
                        Text("Login")
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.BrandOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }.padding()
                    .frame(maxWidth: 300)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

struct LoginBackground: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                ZStack {
                    Color.BrandBlue
                    Image("LoginBg")
                        .resizable()
                        .opacity(0.25)
                }
                
                Color.BrandGray
            }.edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
