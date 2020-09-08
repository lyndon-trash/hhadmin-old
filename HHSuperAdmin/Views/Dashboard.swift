//
//  Dashboard.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct Dashboard: View {
    
    var accessToken: String
    
    var body: some View {
        Text("Todo: App Dashbaoard [\(accessToken)]")
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(accessToken: "test")
    }
}
