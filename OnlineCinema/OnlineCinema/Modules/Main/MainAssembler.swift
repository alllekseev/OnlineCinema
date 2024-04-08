//
//  MainAssembler.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 24.03.2024.
//

import SwiftUI

enum MainAssembler {
    static func build(
        data: MainTypes.Intent.ExternalData
    ) -> some View {
        let model = MainModel()
        let intent = MainIntent(model: model, externalData: data)
        let container = MVIContainer(
            intent: intent as MainIntentProtocol,
            model: model as MainModelStatePotocol,
            modelChangePublisher: model.objectWillChange
        )
        
        return MainView(container: container)
    }
}
