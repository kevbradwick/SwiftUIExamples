//
//  ImplicitAnimationScreen.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 28/12/2020.
//

import SwiftUI

struct ImplicitAnimationScreen: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Button("Animate") {
                self.animationAmount += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            // the animation modifier is our implicit animation method.
            // all state changes will be animated
            .animation(.default)
        }
    }
}

struct ImplicitAnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimationScreen()
    }
}
