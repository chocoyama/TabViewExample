//
//  BeforeView.swift
//  TabViewExample
//
//  Created by Takuya Yokoyama on 2019/11/18.
//  Copyright © 2019 chocoyama. All rights reserved.
//

import SwiftUI

struct BeforeView: View {
    var body: some View {
        TabView {
            NavigationView {
                FirstView()
                    .navigationBarTitle("First")
            }.tabItem {
                    Image(systemName: "1.square")
                    Text("FirstTab")
            }
            .tag(0)
            
            NavigationView {
                SecondView()
                    .navigationBarTitle("Second")
            }
            .tabItem {
                Image(systemName: "2.square")
                Text("SecondTab")
            }
            .tag(1)
            
            NavigationView {
                ThirdView()
                    .navigationBarTitle("Third")
            }
            .tabItem {
                Image(systemName: "3.square")
                Text("ThirdTab")
            }
            .tag(2)
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


struct BeforeView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeView()
    }
}
