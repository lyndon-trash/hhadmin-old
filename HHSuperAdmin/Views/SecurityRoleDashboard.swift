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
//        List(api.securityRoles) { role in
//            SecurityRoleCell(role: role)
//        }.navigationBarTitle("Security Roles")
//            .onAppear {
//                self.api.findAllRoles()
//        }
        
        List {
            ForEach(api.securityRoles) { role in
                SecurityRoleCell(role: role)
            }.onDelete { indexSet in
                print("Delete: \(indexSet.first!)")
            }
        }.navigationBarTitle("Security Roles")
            .onAppear {
                self.api.findAllRoles()
        }
    }
}

struct SecurityRoleCell: View {
    
    let role: SecurityRole
    
    var body: some View {
        HStack {
            Text(String(format: "RL-%d", role.id))
                .font(.caption)
                .fontWeight(.heavy)
                .foregroundColor(.BrandOrange)
                .frame(maxWidth: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(role.name)
                    .font(.title)
                    //.foregroundColor(.BrandBlue)
                
                Text(role.description)
                    .font(.caption)
                    //.foregroundColor(.BrandGray)
            }
        }
        
    }
}

struct SecurityRoleDashboard_Previews: PreviewProvider {
    static var previews: some View {
        SecurityRoleDashboard()
    }
}
