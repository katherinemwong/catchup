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
    @StateObject var listViewModel: ListViewModel = ListViewModel.init()
    @StateObject var groupViewModel: GroupViewModel = GroupViewModel.init()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                GroupsView()
            }
            .environmentObject(listViewModel)
            .environmentObject(groupViewModel)
            .environmentObject(notificationHandler)
        }
    }
    
    
    
}
