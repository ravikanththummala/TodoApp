//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Ravikanth Thummala on 6/6/23.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var lisrViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(lisrViewModel)
        }
    }
}
