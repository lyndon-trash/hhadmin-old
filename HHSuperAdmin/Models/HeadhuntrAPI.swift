//
//  HeadhuntrAPI.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HeadhuntrAPI: ObservableObject {
    
    static let shared = HeadhuntrAPI()
    
    let loginUrl = "\(K.BaseUrl)/oauth/token"
    let listRolesUrl = "\(K.BaseUrl)/api/securityRoles"
    let listCompanyAccountsUrl = "\(K.BaseUrl)/api/companyAccounts"
    
    @Published var accessToken: String?
    @Published var errorMessage: String?
    @Published var securityRoles = [SecurityRole]()
    @Published var companyAccounts = [CompanyAccount]()
    
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
                            } else {
                                self.errorMessage = nil
                                self.accessToken = nil
                            }
                        }
                    case .failure(let error):
                        debugPrint(error)
                        self.errorMessage = nil
                        self.accessToken = nil
                    }
        }
    }
    
    func findAllRoles() {
        
        guard accessToken != nil else {
            return
        }
        
        let headers: HTTPHeaders = [
            .authorization(bearerToken: accessToken!)
        ]
        
        AF.request(listRolesUrl, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success(let result):
                let json = JSON(result)
                let decoder = JSONDecoder()
                if let securityRoles = try? decoder.decode([SecurityRole].self, from: json["_embedded"]["securityRoles"].rawData()) {
                    self.securityRoles = securityRoles
                }
            case .failure(let error):
                debugPrint(error)
                self.errorMessage = nil
                self.accessToken = nil
            }
        }
    }
    
    func findAllCompanyAccounts() {
        
        guard accessToken != nil else {
            return
        }
        
        let headers: HTTPHeaders = [
            .authorization(bearerToken: accessToken!)
        ]
        
        AF.request(listCompanyAccountsUrl, headers: headers).responseJSON { response in
            
            switch response.result {
            case .success(let result):
                let json = JSON(result)
                let decoder = JSONDecoder()
                if let companyAccounts = try? decoder.decode([CompanyAccount].self, from: json["_embedded"]["companyAccounts"].rawData()) {
                    self.companyAccounts = companyAccounts
                }
            case .failure(let error):
                debugPrint(error)
                self.errorMessage = nil
                self.accessToken = nil
            }
        }
    }
}

struct SecurityRole: Identifiable, Codable {
    let id: Int64
    let name: String
    let description: String
}

struct CompanyAccount: Identifiable, Codable {
    let id: Int64
    let name: String
}
