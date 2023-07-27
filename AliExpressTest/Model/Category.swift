//
//  Category.swift
//  AliExpressTest
//
//  Created by Kirill on 25.07.23.
//

import SwiftUI

struct Category: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
