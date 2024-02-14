//
//  File.swift
//  
//
//  Created by mohammadmahdi moayeri on 2/14/24.
//

import SwiftUI

public enum TabLightItem: Hashable {
    case home, favorites, profile
    
    public var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "heart"
        case .profile:
            return "person"
        }
    }
    
    public var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        }
    }
    
    public var color: Color {
        switch self {
        case .home:
            return Color.red
        case .favorites:
            return Color.blue
        case .profile:
            return Color.green
        }
    }
}
