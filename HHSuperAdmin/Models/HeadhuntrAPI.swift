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
    @Published var errorMessage: String?
    
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
        
        AF.request(loginUrl, method: .post,
                   parameters: parameters,
                   headers: headers).responseJSON { response in
            
                    switch response.result {
                    case .success(let result):
                        if let json = result as? NSDictionary {
                            if let errorDescription = json["error_description"] as? String {
                                self.errorMessage = errorDescription
                            } else if let accessToken = json["access_token"] as? String {
                                self.accessToken = accessToken
                            }
                        }
                    case .failure(let error):
                        debugPrint(error)
                    }
        }
    }
}
