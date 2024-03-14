# Tabfinity

 ![](https://img.shields.io/badge/platform-iOS-d3d3d3) ![](https://img.shields.io/badge/iOS-14.0%2B-43A6C6) ![](https://img.shields.io/badge/Swift-5-F86F15)

This library aims to enhance the flexibility of the standard `TabView` component in `SwiftUI`. Instead of being restricted by the limitations of the default TabView, users can now effortlessly customize their tab bars with a variety of stylish options provided by this library. Say goodbye to the hassle of modifying appearance proxies or building custom tab bars from scratch – with this solution, you'll have access to a range of sleek and impressive TabBar styles to elevate your projects.

## Table of contents
   - [Requirements](#requirements)
   - [Installation](#installation)
     - [Swift Package Manager (SPM)](#spm)
   - [Usage](#usage)
     - [Customization](#customization)
   - [Contribution](#contribution)
   - [License](#license)

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
https://github.com/MMMagicCoder/Tabfinity.git
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
The Tabfinity can be changed a lot. You can make it look however you want by using `TabfinityContainerStyle` and `TabfinityItemStyle`. You can easily adjust the size and position of items using the `TabfinityItemSize` class. This class helps you find out how big items are and where they are placed, so you can customize them exactly how you want. These let you create your own unique tab bar designs. When you make custom styles, the tabfinity automatically puts them at the bottom. Explore the examples provided in this package to learn how to customize your tab bar effectively with Tabfinity. 

Once you've made your custom styles, you can easily use them in your tabfinity. Here's an example of what the default tab bar looks like, and some custom design you could use or make:

![Show cases](https://github.com/MMMagicCoder/MMMagicCoder/blob/1a835aca4e1195cb64d540f2243d9ac949362651/Tabfinity/Show%20cases/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-03-11%20at%2019.43.21.png)

## Contribution
<a id="contribution"></a>
If you encounter any challenges, please feel free to [open an issue](https://github.com/MMMagicCoder/Tabfinity/issues/new). Additionally, we welcome and appreciate pull requests for any improvements or contributions.

## License
<a id="license"></a>
Tabfinity is under the terms and conditions of the MIT license.
```
MIT License

Copyright (c) 2024 Mohammad Mahdi Moayeri

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
