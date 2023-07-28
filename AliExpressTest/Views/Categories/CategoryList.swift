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
        GeometryReader { geometryProxy in
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(categories, id: \.self) { category in
                            GeometryReader { cellGeometryProxy in
                                CategoryCell(
                                    category: category,
                                    width: cellWidth
                                )
                                .onTapGesture {
                                    isDetailPresented.toggle()
                                    print(cellGeometryProxy.size, cellGeometryProxy.frame(in: .local), cellGeometryProxy.frame(in: .global), geometryProxy.size, geometryProxy.safeAreaInsets, separator: "\n")
                                }
                                .overlay(
                                    ScaleFullscreenAnimation(
                                        isPresented: $isDetailPresented,
                                        sourceImage: Image("bag"),// TODO: Images
                                        destinationImage: Image("phone"),
                                        sourceFrame: cellGeometryProxy.frame(in: .global),
                                        destinationFrame: CGRect(
                                            x: 0,
                                            y: geometryProxy.safeAreaInsets.top,
                                            width: geometryProxy.size.width,
                                            height: geometryProxy.size.height - (geometryProxy.safeAreaInsets.top + geometryProxy.safeAreaInsets.bottom)
                                        )
                                    )
                                )
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
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .environmentObject(CategoryData())
    }
}
