# Tabfinity

 ![](https://img.shields.io/badge/platform-iOS-d3d3d3) ![](https://img.shields.io/badge/iOS-13.0%2B-43A6C6) ![](https://img.shields.io/badge/Swift-5-F86F15)

This library aims to enhance the flexibility of the standard `TabView` component in `SwiftUI`. Instead of being restricted by the limitations of the default TabView, users can now effortlessly customize their tab bars with a variety of stylish options provided by this library. Say goodbye to the hassle of modifying appearance proxies or building custom tab bars from scratch – with this solution, you'll have access to a range of sleek and impressive TabBar styles to elevate your projects.

## Table of contents
   - [Requirements](#requirements)
   - [Installation](#installation)
     - [Swift Package Manager (SPM)](#spm)
   - [Usage](#usage)
     - [Customization](#customization)
   - [Contribution](#contribution)

## Requirements
<a id="requirements"></a>
   - SwiftUI
   - iOS 14.0 or above

## Installation
<a id="installation"></a>
You can access Tabfinity through [Swift Package Manager](https://github.com/apple/swift-package-manager).
### Swift Package Manager (SPM)
<a id="spm"></a>
In xcode select:
```
File > Swift Packages > Add Package Dependency...
```
Then paste this URL:
```
https://github.com/mohammadmahdimoayeri/Tabfinity.git
```

## Usage
<a id="usage"></a>
To start using the `Tabfinity`, you need to define an enumeration that conforms to the `Finitable` protocol:
```swift
enum Item: Int, Finitable {
    case home, favorites, profile
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.red
        case .favorites: return Color.blue
        case .profile: return Color.green
        }
    }
}
```
Afterward, you will be able to instantiate a Tabfinity:
```swift
struct ContentView: View {
    @State private var selection: Item = .home
    
    var body: some View {
        Tabfinity(selection: $selection) {
            Text("First Tab")
                .tabfinityItem(for: Item.home)
            
            Text("Second Tab")
                .tabfinityItem(for: Item.favorites)
            
            Text("Third Tab")
                .tabfinityItem(for: Item.profile)
        }
        .tabfinityContainer(style: DefaultContainerStyle())
        .tabfinityItem(style: DefaultItemStyle())
    }
}
```
Following these steps, a tabfinity with the default style will be generated.

### Customization
<a id="customization"></a>
The Tabfinity can be changed a lot. You can make it look however you want by using `TabfinityContainerStyle` and `TabfinityItemStyle`. These let you create your own unique tab bar designs. When you make custom styles, the tabfinity automatically puts them at the bottom.

Once you've made your custom styles, you can easily use them in your tabfinity. Here's an example of what the default tab bar looks like, and another design you could make:

## Contribution
<a id="contribution"></a>
