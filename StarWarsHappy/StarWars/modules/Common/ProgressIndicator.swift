//
//  ProgressIndicator.swift
//  StarWarsSad
//
//  Created by Pilar García on 25/3/23.
//

import SwiftUI

struct ProgressIndicator: View {
    var color : Color
    
    @State private var isCircleRotating = true
    @State private var animateStart = false
    @State private var animateEnd = true
    
    var body: some View {
        
        ZStack {
            Circle()
                .trim(from: animateStart ? 1/3 : 1/9, to: animateEnd ? 2/5 : 1)
                .stroke(lineWidth: 5)
                .rotationEffect(.degrees(isCircleRotating ? 360 : 0))
                .frame(width: 48, height: 48)
                .foregroundColor(color)
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false)) {
                                self.isCircleRotating.toggle()
                            }
                        withAnimation(Animation
                            .linear(duration: 1)
                            .delay(0.5)
                            .repeatForever(autoreverses: true)) {
                                self.animateStart.toggle()
                            }
                        withAnimation(Animation
                            .linear(duration: 1)
                            .delay(1)
                            .repeatForever(autoreverses: true)) {
                                self.animateEnd.toggle()
                            }
                    }
                }
        }
    }
}

struct ProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicator(color: .white)
    }
}
