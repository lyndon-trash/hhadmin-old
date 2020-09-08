//
//  CompanyDashboard.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct CompanyDashboard: View {
    
    @ObservedObject var api = HeadhuntrAPI.shared
    
    var body: some View {
        List(api.companyAccounts) { company in
            Text(company.name)
        }.navigationBarTitle("Company Accounts")
            .onAppear {
                self.api.findAllCompanyAccounts()
        }
    }
}

struct CompanyDashboard_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDashboard()
    }
}
