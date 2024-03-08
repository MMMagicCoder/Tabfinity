import SwiftUI


/**
 `Tabfinity` - a customizable tab bar component for SwiftUI applications.
 
 Use `Tabfinity` to incorporate a tab bar that switches between multiple child views 
 using interactive user interface elements.
 
 `Tabfinity` provides flexibility for customization.
 Conform to `TabfinityContainerStyle` and `TabfinityItemStyle` 
 to customize the container and individual tab items, respectively.
 Apply customizations by injecting them into the tabfinity using
 `tabfinityContainer(style:)` for the container and `tabfinityItem(style:)`
 for individual items.
 
 Usage:
 
 ```
 Tabfinity(selection: $selection) { }
 .tabfinityContainer(style: CustomTabContainerStyle())
 .tabfinityItem(style: CustomTabItemStyle())
 ```
 */

public struct Tabfinity<TabfinityItem: Tabbable, Content: View>: View {
    
    @EnvironmentObject var tabfinityItem: TabfinityItemSize
    
    private let selectedItem: TabfinitySelection<TabfinityItem>
    private let content: Content
    
    private var tabfinityItemStyle: AnyTabfinityItemStyle
    private var tabfinityContainerStyle: AnyTabfinityContainerStyle
    
    @State private var tabs: [TabfinityItem]
    
    /**
     Creates a tabfinity component with specified bindings for selection.
     
     Views provided in the `content` closure will be recognized as tabfinity items only
     if they have `tabfinityItem(for:)` applied to them.
     */

    public init(selection: Binding<TabfinityItem>, @ViewBuilder content: () -> Content) {
        self.selectedItem = .init(selection: selection)
        self.content = content()
        
        self.tabfinityItemStyle = .init(itemStyle: DefaultTabfinityItemStyle())
        self.tabfinityContainerStyle = .init(containerStyle: DefaultTabfinityContainerStyle())
        
        self._tabs = .init(initialValue: .init())
    }
    
    public var body: some View {
        ZStack {
            self.content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .environmentObject(self.selectedItem)
            
            GeometryReader { geo in
                VStack {
                    Spacer()
                    
                    self.tabfinityContainerStyle.tabfinityContainer(with: geo) {
                        .init(self.tabfinityItems)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .onPreferenceChange(TabfinityPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

extension Tabfinity {
    private var tabfinityItems: some View {
        HStack {
            ForEach(self.tabs, id: \.self) { item in
                GeometryReader { geo in
                    self.tabfinityItemStyle.tabfinityItem(
                        icon: item.icon,
                        selectedIcon: item.selectedIcon,
                        title: item.title,
                        color: item.color,
                        isSelected: self.selectedItem.selection == item)
                    .updateTabGeoSize(geo.size)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture {
                        self.selectedItem.selection = item
                        self.selectedItem.objectWillChange.send()
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .onPreferenceChange(TabRectangleGeometrySizePreferencedKey.self, perform: { value in
            tabfinityItem.size = value
        })
    }
    
    /**
     Applies the specified tabfinity item style to the `Tabfinity`.
     
     By providing an instance conforming to the `TabfinityItemStyle` protocol,
     the `Tabfinity` will utilize this style for its items.
     
     - Parameters:
        - style: The item style to be applied to the `Tabfinity`.
     
     - Returns:
        A `Tabfinity` with the specified item style applied.
     */

    public func tabfinityItem<ItemStyle: TabfinityItemStyle>(style: ItemStyle) -> Self {
        var _self = self
        _self.tabfinityItemStyle = .init(itemStyle: style)
        return _self
    }
    
    /**
     Applies the specified tabfinity container style to the `Tabfinity`.
     
     By providing an instance conforming to the `TabfinityCintainerStyle` protocol,
     the `Tabfinity` will utilize this style for its container.
     
     - Parameters:
        - style: The container style to be applied to the `Tabfinity`.
     
     - Returns:
        A `Tabfinity` with the specified container style applied.
     */
    public func tabfinityContainer<ContainerStyle: TabfinityContainerStyle>(style: ContainerStyle) -> Self {
        var _self = self
        _self.tabfinityContainerStyle = .init(containerStyle: style)
        return _self
    }
}


