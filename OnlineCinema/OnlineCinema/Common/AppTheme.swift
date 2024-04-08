//
//  AppTheme.swift
//  OnlineCinema
//
//  Created by Лев Бондаренко on 08.04.2024.
//

import UIKit

// TODO: изменить на dynamic color
final class AppTheme {
    static let shared = AppTheme()
    
    let colors = Colors()
    
    struct Colors {
        let accent: UIColor = UIColor(hexString: "#FAB701") ?? .cyan
    }
}
