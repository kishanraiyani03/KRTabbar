//
//  Tab.swift
//  KRTabbar
//
//  Created by Kishan on 03/10/23.
//

import Foundation


enum Tab: String, CaseIterable {
    case home = "Home"
    case services = "Services"
    case partners = "Partners"
    case activity = "Activity"
    
    var systemImage:String {
        switch self {
            
        case .home:
            return "house"
        case .services:
            return "envelope.open.badge.clock"
        case .partners:
            return "hand.raised"
        case .activity:
            return "bell"
        }
    }
    
    var index:Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
