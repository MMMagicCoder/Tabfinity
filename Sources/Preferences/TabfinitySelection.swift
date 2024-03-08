import SwiftUI

class TabfinitySelection<TabfinityItem: Tabbable>: ObservableObject {
    @Binding var selection: TabfinityItem
    
    init(selection: Binding<TabfinityItem>) {
        self._selection = selection
    }
}
