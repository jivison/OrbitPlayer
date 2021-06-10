//
//  MainView.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-05-01.
//

import SwiftUI

struct MainView: View {
    @State private var tab: Tab = .home
    
    var body: some View {
        HStack {
            Sidebar(tab: $tab)
            VStack {
                HStack {
                    Page(tab: tab).frame(width: 1000, height: 500)
                    QueueView()
                }
                PlayerBar()
            }
        }
    }
}

struct Page: View {
    var tab: Tab
    
    var body: some View {
        VStack {
            if self.tab == .search {
                SearchPage()
            } else if self.tab == .library {
                LibraryPage()
            } else {
                HomePage()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
