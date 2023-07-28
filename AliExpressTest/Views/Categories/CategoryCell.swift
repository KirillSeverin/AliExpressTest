//
//  CategoryRow.swift
//  AliExpressTest
//
//  Created by Kirill on 25.07.23.
//

import SwiftUI

struct CategoryCell: View {
    var category: Category
    
    var size: CGSize = CGSize(width: 130, height: 150)
    
    var body: some View {
        category.image
            .resizable()
            .frame(width: size.width, height: size.height)
            .offset(x: size.width/4, y: size.height/3)
            .clipped()
            .overlay(
                Text(category.name)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading, 8)
                    .bold()
                , alignment: .topLeading
            )
            .background(Color(
                red: Double.random(in: 0..<255)/255,
                green: Double.random(in: 0..<255)/255,
                blue: Double.random(in: 0..<255)/255
            ))
            .cornerRadius(25)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var categories = CategoryData().categories
    
    static var previews: some View {
        Group{
            CategoryCell(category: categories[1])
                .previewLayout(.sizeThatFits)
        }
    }
}
