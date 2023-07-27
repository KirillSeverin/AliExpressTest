//
//  AliExpressTestApp.swift
//  AliExpressTest
//
//  Created by Kirill on 25.07.23.
//

import SwiftUI

@main
struct AliExpressTestApp: App {
    @StateObject private var categoryModelData = CategoryData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(categoryModelData)
        }
    }
}
