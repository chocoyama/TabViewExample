//
//  AfterView.swift
//  TabViewExample
//
//  Created by Takuya Yokoyama on 2019/11/18.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI

struct AfterView: View {
    var body: some View {
        TabBarView {
            TabBarItem(
                title: "FirstTab",
                image: .init(systemName: "1.square"),
                tag: 0
            ) {
                AnyView(
                    NavigationView {
                        FirstView()
                            .navigationBarTitle("First")
                    }
                )
            }
            TabBarItem(
                title: "SecondTab",
                image: .init(systemName: "2.square"),
                tag: 1
            ) {
                AnyView(
                    NavigationView {
                        SecondView()
                            .navigationBarTitle("Second")
                    }
                )
            }
            TabBarItem(
                title: "ThirdTab",
                image: .init(systemName: "3.square"),
                tag: 2
            ) {
                AnyView(
                    NavigationView {
                        ThirdView()
                            .navigationBarTitle("Third")
                    }
                )
            }
        }
    }
    
    struct FirstView: View {
        var body: some View {
            NavigationLink(destination: SecondView()) {
                Text("First")
            }.navigationBarTitle("First")
        }
    }

    struct SecondView: View {
        var body: some View {
            Text("Second")
        }
    }

    struct ThirdView: View {
        var body: some View {
            Text("Third")
        }
    }

}

struct AfterView_Previews: PreviewProvider {
    static var previews: some View {
        AfterView()
    }
}
