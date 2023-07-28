//
//  CategoryDetailAnimation.swift
//  AliExpressTest
//
//  Created by Kirill on 27.07.23.
//

import SwiftUI

struct ScaleFullscreenAnimation: View {
    @Binding var isPresented: Bool
    var sourceImage: Image
    var destinationImage: Image
    var sourceFrame: CGRect
    var animation: Animation = .default
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(isPresented ? 0.8 : 0)
        }
        .edgesIgnoringSafeArea(.all)
        .animation(animation, value: isPresented)
        .onTapGesture {
            isPresented.toggle()
        }
    }
}

struct CategoryDetailAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScaleFullscreenAnimation(
                isPresented: .constant(true),
                sourceImage: Image("bag"),
                destinationImage: Image("phone"),
                sourceFrame: .zero
            )
            .previewDisplayName("Presented")
            
            ScaleFullscreenAnimation(
                isPresented: .constant(false),
                sourceImage: Image("bag"),
                destinationImage: Image("phone"),
                sourceFrame: .zero
            )
            .previewDisplayName("Hidden")
        }
    }
}
