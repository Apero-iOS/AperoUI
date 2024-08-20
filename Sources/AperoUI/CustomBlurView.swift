//
//  File.swift
//  
//
//  Created by PC on 6/8/24.
//

import Foundation
//
//  CustomBlurView.swift
//  PDFEditor
//
//  Created by Admin on 19/07/2024.
//

import UIKit

open class CustomBlurView: UIVisualEffectView {
    
    var animator = UIViewPropertyAnimator(duration: 1, curve: .linear)
    
    var intensity = 1.0
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        frame = superview?.bounds ?? CGRect.zero
        setupBlur()
    }
    
    open override func didMoveToSuperview() {
        guard let superview = superview else { return }
        backgroundColor = .clear
        setupBlur()
    }
    
    private func setupBlur() {
        animator.stopAnimation(true)
        effect = nil

        animator.addAnimations { [weak self] in
            self?.effect = UIBlurEffect(style: .regular)
        }
        
        if intensity > 0 && intensity <= 10 {
            
            let value = CGFloat(intensity)/10
            animator.fractionComplete = value
            
        }
        else {
            animator.fractionComplete = 0.05
        }
    }
    
    deinit {
        animator.stopAnimation(true)
    }
}
