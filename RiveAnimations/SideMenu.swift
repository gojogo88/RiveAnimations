//
//  SideMenu.swift
//  RiveAnimations
//
//  Created by Jonathan Go on 17.07.22.
//
import RiveRuntime
import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_interactivity", artboardName: "SEARCH")),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_interactivity", artboardName: "LIKE/STAR")),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_interactivity", artboardName: "CHAT"))
]

struct SideMenu: View {
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Jonathan Go")
                        .customFont(.body)
                    
                    Text("Swift Developer")
                        .customFont(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
            }
            .padding()
            
            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    
                    HStack(spacing: 14) {
                        item.icon.view()
                            .frame(width: 32, height: 32)
                            .opacity(0.6)
                        
                        Text(item.text)
                            .customFont(.headline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .onTapGesture {
                        item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            item.icon.setInput("active", value: false)
                        }
                }
                }
            }
            .padding(8)
            
            Spacer()
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
