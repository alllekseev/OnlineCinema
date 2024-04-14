//
//  HomeView.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 11.03.2024.
//

import SwiftUI


final class HomeCoordinator: Hashable {
    @Binding var navigationPath: NavigationPath

    private var id: UUID
    private var output: Output?

    struct Output {}

    init(
        navigationPath: Binding<NavigationPath>,
        output: Output? = nil,
        mainView: MainView
    ) {
        id = UUID()
        self.output = output
        self._navigationPath = navigationPath
    }

    @ViewBuilder
    func view() -> some View {
        HomeAssembler.build(data: .init(title: "Home"))
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (
        lhs: HomeCoordinator,
        rhs: HomeCoordinator
    ) -> Bool {
        lhs.id == rhs.id
    }

    func push<V>(_ value: V) where V : Hashable {
        navigationPath.append(value)
    }
}

struct HomeView: View {

    @StateObject var container: MVIContainer<HomeIntentProtocol, HomeModelStatePotocol>
    
    private var intent: HomeIntentProtocol { container.intent }
    private var state: HomeModelStatePotocol { container.model }
    
    var body: some View {
        ScrollView {
            ZStack {
                Image("Main screen")
                    .resizable()
                    .scaledToFill()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct CustomView: View {
    @State private var text: String = ""

    var body: some View {
        Text(text)
    }
}

struct NavigationConfiguration: UIViewControllerRepresentable {
    
    init() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.shadowColor = .clear
            navBarAppearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = navBarAppearance
        }
        
    func makeUIViewController(
            context: UIViewControllerRepresentableContext<NavigationConfiguration>
        ) -> UIViewController {
            UIViewController()
        }
        
    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfiguration>) {}
    
}
