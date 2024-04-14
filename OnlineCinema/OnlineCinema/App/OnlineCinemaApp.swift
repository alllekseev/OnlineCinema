//
//  OnlineCinemaApp.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 07.03.2024.
//

import SwiftUI

@main
struct OnlineCinemaApp: App {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.view()
                    .navigationDestination(for: HomeCoordinator.self) { coordinator in
                        coordinator.view()
                    }
                    .environmentObject(appCoordinator)
            }
            .navigationBarTitleDisplayMode(.inline)
                       .background(NavigationConfiguration())
        }
    }
}
