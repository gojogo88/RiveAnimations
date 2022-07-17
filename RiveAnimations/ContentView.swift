//
//  ContentView.swift
//  RiveAnimations
//
//  Created by Jonathan Go on 16.07.22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .chat:
                Text("Chat")
            case .search:
                Text("Search")
            case .timer:
                Text("Timer")
            case .bell:
                Text("Bell")
            case .user:
                Text("User")
            }

            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
