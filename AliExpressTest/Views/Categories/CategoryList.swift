//
//  CategoryList.swift
//  AliExpressTest
//
//  Created by Kirill on 25.07.23.
//

import SwiftUI

struct CategoryList: View {
    @EnvironmentObject var categoryData: CategoryData
    
    var categories: [Category] {
        categoryData.categories
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories) { category in
                    CategoryCell(category: category)
                }
            }
            .padding(.horizontal,20)
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .environmentObject(CategoryData())
    }
}
