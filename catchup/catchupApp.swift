//
//  catchupApp.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import SwiftUI

@main
struct catchupApp: App {
    
    @State var notificationHandler: NotificationHandler = NotificationHandler.init()
    @State var listViewModel: ListViewModel = ListViewModel.init()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                GroupsView()
            }
            .environmentObject(listViewModel)
            .environmentObject(notificationHandler)
        }
    }
    
    
    
}
