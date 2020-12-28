//
//  ProgressCircleAnimationScreen.swift
//  SwiftUIExamples
//
//  Created by Kevin Bradwick on 28/12/2020.
//

import SwiftUI

struct ProgressCircleAnimationScreen: View {
    
    // ProgressBar is the reusable circle view.
    // the color and progress will both be animated
    struct ProgressBar: View {
        @Binding var progress: Double
        
        private let colourOne = Color(red: 235/255, green: 174/255, blue: 52/255)
        private let colourTwo = Color(red: 235/255, green: 107/255, blue: 52/255)
        private let colourThree = Color(red: 235/255, green: 58/255, blue: 52/255)
        
        var body: some View {
            ZStack {
                // the background circle.
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(colourForProgress())
                
                // the progress circle. the animation will be placed on this view alone
                // and all properties that change will be animated
                Circle()
                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 24.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(colourForProgress())
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                
                // text value inside the circle to show % progress
                Text(String(format: "%.0f %%", min(self.progress, 1) * 100.00))
                    .font(.largeTitle)
                    .bold()
            }
        }
        
        // decides which colour should be used based on the progress amount
        func colourForProgress() -> Color {
            if progress < 0.33 {
                return colourOne
            } else if progress > 0.66 {
                return colourThree
            } else {
                return colourTwo
            }
        }
    }
    
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            ProgressBar(progress: $progress)
                .padding(40.0)
            
            // simple button that will randomise the progress value
            Button(action: {
                self.progress = Double.random(in: 0..<1)
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("Increment")
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(lineWidth: 2.0))
            }
            Spacer()
        }
        .navigationBarTitle(Text("Progress Circle Animation"))
    }
}

struct ProgressCircleAnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleAnimationScreen()
    }
}
