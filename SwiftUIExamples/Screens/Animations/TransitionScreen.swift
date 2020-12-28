//
//  TransitionScreen.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 28/12/2020.
//

import SwiftUI

// custom transition to slide up on enter and down on out
extension AnyTransition {
    static var popup: AnyTransition {
        AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom))
    }
}

struct TransitionScreen: View {
    
    // the overlay that will be presented on the screen
    struct Overlay: View {
        private let gradientFrom = Color(red: 240/255, green: 105/255, blue: 102/255)
        private let gradientTo = Color(red: 250/255, green: 214/255, blue: 166/255)
        
        @Binding var showOverlay: Bool
        
        var body: some View {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                            gradient: .init(colors: [gradientFrom, gradientTo]),
                            startPoint: .bottomLeading,
                            endPoint: .topLeading))
                VStack {
                    Text("Overlay").font(.title).bold()
                    Button(action: {
                        self.showOverlay.toggle()
                    }) {
                        HStack {
                            Image(systemName: "xmark")
                            Text("Close")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40.0)
                    }
                }
            }
        }
    }
    
    @State var showOverlay: Bool = false
    
    var body: some View {
        // applying zIndex are important here to prevent unwanted layering issues
        // when the content is being re-rendered.
        ZStack {
            Button(action: {
                self.showOverlay.toggle()
            }) {
                Text("Show Overlay")
            }
            .zIndex(1)
            
            if showOverlay {
                Overlay(showOverlay: $showOverlay)
                    .transition(.popup)
                    .animation(.easeIn)
                    .ignoresSafeArea()
                    .zIndex(2)
            }
        }
    }
}

struct TransitionScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransitionScreen()
    }
}
