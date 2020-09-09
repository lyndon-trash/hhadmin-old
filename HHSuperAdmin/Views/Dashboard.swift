//
//  Dashboard.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

let dashboardItems = [
    "Roles",
    "Companies"
]

struct Dashboard: View {
    
    var accessToken: String
    
    var body: some View {
        NavigationView {
            
            MasterView().navigationBarTitle("headhuntr.io")
            
            DetailView(dasboardItem: dashboardItems[0])
        }
    }
}

struct MasterView: View {
    
    var body: some View {
        List {
            ForEach(dashboardItems, id: \.self) { item in
                NavigationLink(
                    destination: DetailView(dasboardItem: item)
                ) {
                    Text(item)
                }
            }
        }
    }
}

struct DetailView: View {
    
    let dasboardItem: String

    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            if dasboardItem == dashboardItems[0] {
                SecurityRoleDashboard()
            } else {
                CompanyDashboard()
            }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(accessToken: "test")
    }
}
