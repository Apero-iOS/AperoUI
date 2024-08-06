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

        reatingApp
            .configIconApp {
            $0.image = UIImage(named: "image 1054")
        }
            .onRate {
                if $0 >= 3{
                    print("kjdhfkdj")
                }
            }
    
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        view.sendSubviewToBack(blurEffectView)

    }

    public func configureRatingView(_ config: (RatingApp) -> Void) -> Self{
        config(reatingApp)
        return self
    }
}
