//
//  AppCoordinator.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 07.04.2024.
//

import SwiftUI


final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath

    init(path: NavigationPath) {
        self.path = path
    }

    @ViewBuilder
    func view() -> some View {
        MainAssembler.build(data: .init(title: "Test"))
    }
}
