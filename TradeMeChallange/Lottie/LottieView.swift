//
//  LottieView.swift
//  Stamps
//
//  Created by Inti Albuquerque on 26/11/21.
//

import Foundation

import SwiftUI
import Lottie

enum LottieAnimationName: String {
    case loading = "loading-animation"
}

struct LottieView: UIViewRepresentable {
    var name: LottieAnimationName
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        
        animationView.animation = Animation.named(name.rawValue)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        animationView.play()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}
