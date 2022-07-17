//
//  OnboardingView.swift
//  RiveAnimations
//
//  Created by Jonathan Go on 16.07.22.
//
import RiveRuntime
import SwiftUI

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            background
            
            content
            
            if showModal {
                SignInView()
                    .transition(.move(edge: .bottom))
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learn Design & Code")
                .customFont(.largeTitle)
                .frame(width: 260, alignment: .leading)
            
            Text("Don't skip design. Learn design and code, by building real apps with SwiftUI. Complete courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay {
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                }
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModal = true
                        }
                    }
            }
            
            Text("Lorem ipsum dolor. Lorem ipsum dolor. Lorem ipsum dolor. Lorem ipsum dolor. Lorem ipsum dolor.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
