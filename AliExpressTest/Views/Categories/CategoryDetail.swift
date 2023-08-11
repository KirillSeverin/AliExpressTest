//
//  CategoryDetail.swift
//  AliExpressTest
//
//  Created by Kirill on 26.07.23.
//

import SwiftUI

struct CategoryDetail: View {
    
    var body: some View {
        VStack {
            Text("Hey")
        }
    }
}

struct CategoryDetail_Previews: PreviewProvider {
    static var categoriesData = CategoryData()
    
    static var previews: some View {
        CategoryDetail()
            .environmentObject(categoriesData)
    }
}
