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
    @State private var isAnimationVisible = false
    @State private var tappedCellFrame: CGRect = .zero
    @State private var isAnimationInteractionDisabled = false
    
    private let animationDuration: CGFloat = 0.5
    
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
                                    //ImageRenderer?
                                    //Сверстать полноэкранное
                                    CategoryCell(
                                        category: category,
                                        size: cellSize
                                    )
                                    .onTapGesture {
                                        tappedCellFrame = cellGeometryProxy.frame(in: .global)
                                        isAnimationVisible = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                            isDetailPresented.toggle()
                                        }
                                        print("Tap")
                                    }
//                                    openWindow(id: windowIDs.categoryDelailID)
                                }
                                .frame(width: cellSize.width)
                            }
                        }
                        .padding(.horizontal,20)
                    }
                    .frame(height: cellSize.height)
                }
                
                ScaleFullScreenAnimation(
                    isPresented: $isDetailPresented,
                    isVisible: $isAnimationVisible,
                    sourceImage: Image("bag"),// TODO: Images
                    destinationImage: Image("phone"),
                    sourceFrame: $tappedCellFrame,
                    destinationFrame: CGRect(
                        x: 0,
                        y: geometryProxy.safeAreaInsets.top,
                        width: geometryProxy.size.width,
                        height: geometryProxy.size.height
                    ),
                    animation: .linear(duration: animationDuration)
                )
                .disabled(isAnimationInteractionDisabled)
                .opacity(isAnimationVisible ? 1 : 0)
            }
            .onChange(of: isDetailPresented) { newValue in
                isAnimationInteractionDisabled = true
                if newValue {
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration + 0.1) {
                        isAnimationInteractionDisabled = false
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration + 0.1) {
                        isAnimationVisible = false
                        isAnimationInteractionDisabled = false
                    }
                }
            }
        }
    }
    
//    func destinationAnimationImage() -> some View {
////        Renderer (CategoryDetail)
//    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .environmentObject(CategoryData())
    }
}
