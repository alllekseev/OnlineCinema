//
//  HomeModel.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 11.03.2024.
//

import SwiftUI
import Combine
import AVKit

// MARK: - View State
/// Протокол для состояний. Отдаем его View
protocol HomeModelStatePotocol {
    var selectedIndex: Int { get }
}

// MARK: - Intent Actions

/// Протокол для событий. Отдаем его Model
protocol HomeModelActionsProtocol: AnyObject {
    func update(selectedIndex: Int)
}

// MARK: - State Impl
final class HomeModel: ObservableObject, HomeModelStatePotocol {

    @Published var selectedIndex: Int = 0
    
}

// MARK: - Actions Protocol
extension HomeModel: HomeModelActionsProtocol {
    
    func update(selectedIndex: Int) {
        self.selectedIndex = selectedIndex
    }
}
