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
    //var displayModule - color 
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
