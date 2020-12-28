//
//  ExplicitAnimationScreen.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 28/12/2020.
//

import SwiftUI

struct ExplicitAnimationScreen: View {
    @State var size: CGFloat = 100.0
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: size, height: size)
                .foregroundColor(.red)
            
            Button("Animate") {
                // explicit animation are applied to specific properties whereas
                // implicit animations applied using the animate() modifier will animate
                // all state changes. explicit animations are useful when you only want to
                // animate specific properties.
                withAnimation {
                    self.size += 50
                }
            }
        }
        
    }
}

struct ExplicitAnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationScreen()
    }
}
