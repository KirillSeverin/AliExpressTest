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
    @State private var tappedCellFrame: CGRect = .zero
    
    private var categories: [Category] {
        categoryData.categories
    }
    
    private let cellSize = CGSize(width: 130, height: 150)
    
    var body: some View {
        GeometryReader { geometryProxy in
            ZStack {
                NavigationView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(categories, id: \.self) { category in
                                GeometryReader { cellGeometryProxy in
                                    CategoryCell(
                                        category: category,
                                        size: cellSize
                                    )
                                    .onTapGesture {
                                        tappedCellFrame = cellGeometryProxy.frame(in: .global)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                            isDetailPresented.toggle()
                                        }
                                        print("Cell Tap")
                                    }
                                    //                                 {
                                    //                            openWindow(id: windowIDs.categoryDetailID)
                                    //                        })
                                }
                                .frame(width: cellSize.width)
                            }
                        }
                        .padding(.horizontal,20)
                    }
                    .frame(height: cellSize.height)
                }
                
                ScaleFullscreenAnimation(
                    isPresented: $isDetailPresented,
                    sourceImage: Image("bag"),// TODO: Images
                    destinationImage: Image("phone"),
                    sourceFrame: $tappedCellFrame,
                    destinationFrame: CGRect(
                        x: 0,
                        y: geometryProxy.safeAreaInsets.top,
                        width: geometryProxy.size.width,
                        height: geometryProxy.size.height + (geometryProxy.safeAreaInsets.top + geometryProxy.safeAreaInsets.bottom)
                    )
                )
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
