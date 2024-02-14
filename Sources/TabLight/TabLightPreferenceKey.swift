//
//  File.swift
//  
//
//  Created by mohammadmahdi moayeri on 2/14/24.
//

import SwiftUI

struct TabLightPreferencedKey: PreferenceKey {
    static var defaultValue: [TabLightItem] = []
    
    static func reduce(value: inout [TabLightItem], nextValue: () -> [TabLightItem]) {
        value += nextValue()
    }
}

struct TabLightItemViewModifier: ViewModifier {
    let tab: TabLightItem
    @Binding var selection: TabLightItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabLightPreferencedKey.self, value: [tab])
    }
}

extension View {
    public func tabLightItem(tab: TabLightItem, selection: Binding<TabLightItem>) -> some View {
        self
            .modifier(TabLightItemViewModifier(tab: tab, selection: selection))
    }
}
