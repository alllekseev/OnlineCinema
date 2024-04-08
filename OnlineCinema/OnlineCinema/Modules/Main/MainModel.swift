//
//  MainModel.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 24.03.2024.
//

import SwiftUI
import Combine
import AVKit

// MARK: - View State
/// Протокол для состояний. Отдаем его View
protocol MainModelStatePotocol {
    var selectedIndex: Int { get }
}

// MARK: - Intent Actions

/// Протокол для событий. Отдаем его Model
protocol MainModelActionsProtocol: AnyObject {
    func update(selectedIndex: Int)
}

// MARK: - State Impl
final class MainModel: ObservableObject, MainModelStatePotocol {
    @Published var selectedIndex: Int = 0
    
}

// MARK: - Actions Protocol
extension MainModel: MainModelActionsProtocol {
    
    func update(selectedIndex: Int) {
        self.selectedIndex = selectedIndex
    }
}

