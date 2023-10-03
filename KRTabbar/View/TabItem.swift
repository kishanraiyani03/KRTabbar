//
//  TabItem.swift
//  KRTabbar
//
//  Created by Kishan on 03/10/23.
//

import SwiftUI

struct TabItem: View {
    var tint:Color
    var inactiveTint:Color
    var tab:Tab
    var animation:Namespace.ID
    
    @Binding var activeTab:Tab
    
    var body: some View {
        VStack {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle().fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : inactiveTint)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
        }
    }
}


struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
