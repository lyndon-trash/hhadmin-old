//
//  ContentView.swift
//  HHSuperAdmin
//
//  Created by StartupBuilder.INFO on 9/8/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var api = HeadhuntrAPI.shared
    
    var body: some View {
        ConditionalView(accessToken: api.accessToken)
    }
}

struct ConditionalView: View {
    
    var accessToken: String?
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            if accessToken != nil {
                Dashboard(accessToken: accessToken!)
            } else {
                Login()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
