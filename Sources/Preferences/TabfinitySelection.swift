import SwiftUI

class TabfinitySelection<TabfinityItem: Finitable>: ObservableObject {
    @Binding var selection: TabfinityItem
    
    init(selection: Binding<TabfinityItem>) {
        self._selection = selection
    }
}
