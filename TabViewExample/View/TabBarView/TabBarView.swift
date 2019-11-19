//
//  TabBarView.swift
//  stores.native
//
//  Created by Takuya Yokoyama on 2019/11/09.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI

func TabBarView<Content>(@TabBarItemBuilder<Content> _ items: () -> [TabBarItem<Content>]) -> _TabBarView<Content> where Content: View {
    _TabBarView(items())
}

@_functionBuilder struct TabBarItemBuilder<Content> where Content: View {
    typealias Item = TabBarItem<Content>
    
    static func buildBlock(_ a: Item) -> [Item] {
        [a]
    }
    
    static func buildBlock(_ a: Item, _ b: Item) -> [Item] {
        [a, b]
    }
    
    static func buildBlock(_ a: Item, _ b: Item, _ c: Item) -> [Item] {
        [a, b, c]
    }
    
    static func buildBlock(_ a: Item, _ b: Item, _ c: Item, _ d: Item) -> [Item] {
        [a, b, c, d]
    }
    
    static func buildBlock(_ a: Item, _ b: Item, _ c: Item, _ d: Item, _ e: Item) -> [Item] {
        [a, b, c, d, e]
    }
}

struct _TabBarView<Content>: View where Content: View {
    private let items: [TabBarItem<Content>]
    
    init(_ items: [TabBarItem<Content>]) {
        self.items = items
    }
    
    var body: some View {
        let elements = items.map { (item: TabBarItem) -> TabBarController.Element in
            let controller = UIHostingController(rootView: item.content())
            
            let tabBarItem = UITabBarItem(
                title: item.title,
                image: item.image.flatMap {
                    UIImage(systemName: $0.systemName)!
                        .scaleImage(to: $0.size) // Extension
                },
                tag: item.tag
            )
            
            return TabBarController.Element(
                controller: controller,
                tabBarItem: tabBarItem
            )
        }
        return TabBarController(elements)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarItem<Content> where Content: View {
    let title: String
    let image: Image?
    let tag: Int
    let content: () -> Content
    
    struct Image {
        let systemName: String
        let size: CGSize
        
        init(systemName: String, size: CGSize = .init(width: 20, height: 20)) {
            self.systemName = systemName
            self.size = size
        }
    }

    init(
        title: String,
        image: Image?,
        tag: Int,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.image = image
        self.tag = tag
        self.content = content
    }
}

private extension UIImage {
    func scaleImage(to scaleSize: CGSize) -> UIImage {
        let widthRatio = scaleSize.width / size.width
        
        
        let heightRatio = scaleSize.height / size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio

        let resizedSize = CGSize(width: size.width * ratio, height: size.height * ratio)

        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0)
        draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return resizedImage!
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView {
            TabBarItem(
                title: "First",
                image: .init(systemName: "heart", size: .init(width: 20, height: 20)),
                tag: 0
            ) {
                AnyView(Text("First"))
            }
            TabBarItem(
                title: "Second",
                image: .init(systemName: "heart", size: .init(width: 20, height: 20)),
                tag: 1
            ) {
                AnyView(Text("Second"))
            }
        }
    }
}

