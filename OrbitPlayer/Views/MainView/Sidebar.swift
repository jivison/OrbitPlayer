//
//  Sidebar.swift
//  OrbitPlayer
//
//  Created by John Ivison on 2021-05-01.
//

import SwiftUI

enum Tab: String, CaseIterable, Identifiable {
    case home, library, search
    
    var id: String { self.rawValue }
}

struct Sidebar: View {
    @Binding var tab: Tab
    
    var body: some View {
        VStack {
            ForEach(Tab.allCases) { tab in
                SidebarItem(tab: tab, tabBinding: $tab).padding(.bottom)
            }
        }
    }
}

struct SidebarItem: View {
    var tab: Tab
    @Binding var tabBinding: Tab
    
    var body: some View {
        VStack {
            self.getIcon()
                .resizeKeepingAspectRatio(width: 50, height: 50)
        }.onTapGesture(perform: onClick)
    }
    
    private func onClick() {
        self.tabBinding = self.tab
    }
    
    private func getIcon() -> Image {
        var systemName = "questionmark"
        
        switch self.tab {
        case .home:
            systemName = "house"
        case .library:
            systemName = "books.vertical"
        case .search:
            systemName = "magnifyingglass"
        }
        
        return Image(systemName: systemName)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            Sidebar(tab: .constant(.home))
        }
    }
}
