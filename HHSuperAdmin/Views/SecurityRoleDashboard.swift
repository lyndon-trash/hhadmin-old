//
//  SecurityRoleDashboard.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct SecurityRoleDashboard: View {
    
    @ObservedObject var api = HeadhuntrAPI.shared
    
    var body: some View {
        List(api.securityRoles) { role in
            Text(role.name)
        }.navigationBarTitle("Security Roles")
            .onAppear {
                self.api.findAllRoles()
        }
    }
}

struct SecurityRoleDashboard_Previews: PreviewProvider {
    static var previews: some View {
        SecurityRoleDashboard()
    }
}
