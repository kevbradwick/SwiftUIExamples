//
//  TransitionScreen.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 28/12/2020.
//

import SwiftUI

struct TransitionScreen: View {
    struct Overlay: View {
        private let gradientFrom = Color(red: 240/255, green: 105/255, blue: 102/255)
        private let gradientTo = Color(red: 250/255, green: 214/255, blue: 166/255)
        
        var body: some View {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                            gradient: .init(colors: [gradientFrom, gradientTo]),
                            startPoint: .bottomLeading,
                            endPoint: .topLeading))
                VStack {
                    Text("Overlay").font(.title).bold()
                    Button(action: {}) {
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
    
    var body: some View {
        ZStack {
            Overlay()
        }
    }
}

struct TransitionScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransitionScreen()
    }
}
