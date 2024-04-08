//
//  MainIntent.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 24.03.2024.
//

import Foundation

protocol MainIntentProtocol {
    func viewOnAppear()
    func viewOnDisappear()
    func didTapHandler()
}

enum MainTypes {
    enum Intent {}
}

/// Отвечает за обработку действий
final class MainIntent {

    // MARK: Model
    private weak var model: MainModelActionsProtocol?

    // MARK: Business Data
    private let externalData: MainTypes.Intent.ExternalData

    // MARK: Life cycle
    init(
        model: MainModelActionsProtocol,
        externalData: MainTypes.Intent.ExternalData
    ) {
        self.externalData = externalData
        self.model = model
    }
}

// MARK: - Public
extension MainIntent: MainIntentProtocol {

    func viewOnAppear() {}

    func viewOnDisappear() {}
    
    func didTapHandler() {}
}

// MARK: - Helper classes
extension MainTypes.Intent {
    struct ExternalData {
        let title: String
    }
}
