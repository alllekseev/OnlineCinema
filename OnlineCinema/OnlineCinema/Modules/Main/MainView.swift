//
//  MainView.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 24.03.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainModelStatePotocol>
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    @State var selectedTab: BottomBarItem = .home
    
    private var intent: MainIntentProtocol { container.intent }
    private var state: MainModelStatePotocol { container.model }

    let disciplines = ["statue", "mural", "plaque"]
    var body: some View {
        ZStack {
            VStack {
                selectedTab.getScreen()
            }
            VStack {
                Spacer()
                BottomBar(selected: $selectedTab)
                    .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .background(.ultraThinMaterial)
            }
        }

    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
