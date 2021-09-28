//
//  PracticaIOSAvanzadoApp.swift
//  Shared
//
//  Created by Freddy A. on 9/25/21.
//

import SwiftUI

@main
struct PracticaIOSAvanzadoApp: App {
    @StateObject var rootViewModel = RootViewModel() //viewmodel global en la App
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel) //inyectas el view model en el login
        }
    }
}
