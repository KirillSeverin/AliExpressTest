//
//  AliExpressTestApp.swift
//  AliExpressTest
//
//  Created by Kirill on 25.07.23.
//

import SwiftUI

@main
struct AliExpressTestApp: App {
    @StateObject private var categoryData = CategoryData()
//    @StateObject private var windowsIDs = ConstantsModel.WindowsIDs()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(categoryData)
//                .environmentObject(windowsIDs)
        }
        
//        WindowGroup(id: windowsIDs.categoryDelailID) {
//            
//        }
    }
}
