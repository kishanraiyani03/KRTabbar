//
//  Home.swift
//  KRTabbar
//
//  Created by Kishan on 03/10/23.
//

import SwiftUI

struct Home: View {
    @State var activeTab:Tab = .home
    @Namespace private var animation
    
    var body: some View {
        VStack {
            TabView(selection: $activeTab, content: {
                Text("Home")
                    .tag(Tab.home)
                Text("Services")
                    .tag(Tab.services)
                Text("Partners")
                    .tag(Tab.partners)
                Text("Activty")
                    .tag(Tab.activity)
            })
            CustomTabbar()
        }
    }
    
    @ViewBuilder
    func CustomTabbar(_ tint:Color = Color.blue, _ inactiveTint:Color = .gray) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { item in
                TabItem(tint: tint, inactiveTint: inactiveTint, tab: item, animation: animation, activeTab: $activeTab)
            }
        }
        .padding(.horizontal,15)
        .padding(.vertical, 10)
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.7), value: activeTab)
        .background{
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .padding(.top,25)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
