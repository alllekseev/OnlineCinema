//
//  BottomBar.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 08.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Content")
    }
}

enum BottomBarItem: String {
    case home
    case fav
    case search
    case profile
    
    @ViewBuilder
    func getScreen() -> some View {
        switch self {
        case .home:
            HomeAssembler.build(data: .init(title: self.rawValue))
        default:
            ContentView()
        }
    }
}

struct BottomBar: View {
    @Binding var selected : BottomBarItem
    
    private let bottomBarItems: [BottomBarItem] = [
        .home,
        .fav
    ]
    
    var body : some View {
        HStack {
            ForEach(0..<bottomBarItems.count) { item in
                Button {
                    selected = bottomBarItems[item]
                } label: {
                    BottomBarButtonView(
                        image: bottomBarItems[item].rawValue,
                        text: bottomBarItems[item].rawValue,
                        isActive: bottomBarItems[item] == selected
                    )
                }
            }
        }
    }
}

struct BottomBarButtonView: View {
    
    var image: String
    var text: String
    var isActive: Bool
    
    var body: some View {
        HStack(spacing: 10){
            VStack(spacing:  3){
                Rectangle()
                    .frame(height: 0)
                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isActive ? Color(AppTheme.shared.colors.accent) : .black)
            }
        }
    }
}
