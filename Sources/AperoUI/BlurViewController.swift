//
//  BlurViewController.swift
//  
//
//  Created by PC on 5/8/24.
//

import UIKit

public class BlurViewController: UIViewController {
    
    @IBOutlet weak var reatingApp: RatingApp!
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        view.backgroundColor = .black.withAlphaComponent(0.4)
        view.addBlurrEffect(intensity: 1.2)
        view.bringSubviewToFront(reatingApp)
        
    }
    ///configure Rating View
    @discardableResult
    public func configureRatingView(_ config: (RatingApp) -> Void) -> Self{
        config(reatingApp)
        return self
    }
    ///Create BlurViewController from nibName
    public static func create()-> BlurViewController{
        BlurViewController(nibName: "BlurViewController", bundle: .AperoUI)
    }
}

extension UIView{
    /// set Blur for UIView
   public func addBlurrEffect(intensity: Double = 1) {
        let blurEffectView = CustomBlurView() // creating a blur effect view
        blurEffectView.intensity = intensity // setting blur intensity from 0.1 to 10
        self.addSubview(blurEffectView) // adding blur effect view as a subview to your view in which you want to use
    }
    /// remove Blur for UIView
     public func removeBlurEffect() {
        for subview in self.subviews {
          if subview is UIVisualEffectView {
              subview.removeFromSuperview()
          }
        }
    }
}
