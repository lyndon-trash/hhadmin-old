//
//  HeadhuntrAPI.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import Foundation
import Alamofire

class HeadhuntrAPI: ObservableObject {
    
    static let shared = HeadhuntrAPI()
    
    let loginUrl = "\(K.BaseUrl)/oauth/token"
    
    @Published var accessToken: String?
    
    func login(username: String, password: String) {
        
        let headers: HTTPHeaders = [
            .authorization(username: K.ClientUsername, password: K.ClientPassword),
            .contentType("application/x-www-form-urlencoded")
        ]
        
        let parameters = [
            "grant_type": "password",
            "scope": "any",
            "username": username,
            "password": password
        ]
        
        AF.request(loginUrl, method: .post, parameters: parameters, headers: headers).response { response in
            self.accessToken = response.debugDescription
        }
    }
}
