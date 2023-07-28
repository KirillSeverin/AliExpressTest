//
//  CategoryList.swift
//  AliExpressTest
//
//  Created by Kirill on 25.07.23.
//

import SwiftUI

struct CategoryList: View {
    @StateObject private var categoryData = CategoryData()
    
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject private var windowIDs: ConstantsModel.WindowsIDs
    @State private var isDetailPresented = false
    
    private var categories: [Category] {
        categoryData.categories
    }
    
    private let cellWidth: CGFloat = 130
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        GeometryReader { geometryProxy in
                            CategoryCell(
                                category: category,
                                width: cellWidth
                            )
                            .onTapGesture {
                                isDetailPresented.toggle()
                                print(geometryProxy.size, geometryProxy.frame(in: .local), geometryProxy.frame(in: .global), separator: "\n")
                            }
//                            .overlay(
//                                ScaleFullscreenAnimation(
//                                    isPresented: $isDetailPresented,
//                                    sourceImage: Image("bag"),// TODO: Images
//                                    destinationImage: Image("phone"),
//                                    sourceFrame: .zero
//                                )
//                            )
    //                                 {
    //                            openWindow(id: windowIDs.categoryDetailID)
    //                        })
                        }
                        .frame(width: cellWidth)
                    }
                }
                .padding(.horizontal,20)
            }
        }
        
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .environmentObject(CategoryData())
    }
}
