//
//  CategoryDetailAnimation.swift
//  AliExpressTest
//
//  Created by Kirill on 27.07.23.
//

import SwiftUI

struct ScaleFullscreenAnimation: View {
    @Binding var isPresented: Bool
    @Binding var isVisible: Bool
    var sourceImage: Image
    var destinationImage: Image
    @Binding var sourceFrame: CGRect
    var destinationFrame: CGRect
    var animation: Animation = .default
    
    var body: some View {
        GeometryReader { geometryProxy in
            ZStack {
                Color.black
                    .opacity(isPresented ? 0.8 : 0.5)
                    .ignoresSafeArea()
                
                sourceImage
                    .resizable()
                    .opacity(isPresented ? 0 : 1)
                
                destinationImage
                    .resizable()
                    .opacity(isPresented ? 1 : 0)
            }
            .animation(animation, value: isPresented)
            .offset(
                x: isPresented ? 0 : sourceFrame.origin.x,
                y: isPresented ? 0 : sourceFrame.origin.y - geometryProxy.safeAreaInsets.top
            )
            .frame(
                width: isPresented ? destinationFrame.width : sourceFrame.width,
                height: isPresented ? destinationFrame.height : sourceFrame.height
            )
            .onTapGesture {
                isPresented.toggle()
            }
        }
    }
}

struct CategoryDetailAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScaleFullscreenAnimation(
                isPresented: .constant(true),
                isVisible: .constant(true),
                sourceImage: Image("bag"),
                destinationImage: Image("phone"),
                sourceFrame: .constant(
                    CGRect(x: 20.0, y: 59.0, width: 130.0, height: 759.0)
                ),
                destinationFrame: CGRect(
                    x: 0,
                    y: 59,
                    width: 393,
                    height: 759
                )
            )
            .previewDisplayName("Presented")
            
            ScaleFullscreenAnimation(
                isPresented: .constant(false),
                isVisible: .constant(false),
                sourceImage: Image("bag"),
                destinationImage: Image("phone"),
                sourceFrame: .constant(
                    CGRect(x: 20.0, y: 59.0, width: 130.0, height: 759.0)
                ),
                destinationFrame: CGRect(
                    x: 0,
                    y: 59,
                    width: 393,
                    height: 759
                )
            )
            .previewDisplayName("Hidden")
        }
    }
}
