//
//  ContentView.swift
//  AliExpressTest
//
//  Created by Kirill on 25.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CategoryList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CategoryData())
    }
}
