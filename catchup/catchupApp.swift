//
//  catchupApp.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import SwiftUI

@main
struct catchupApp: App {
    
    @State var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
    
    
    
}
