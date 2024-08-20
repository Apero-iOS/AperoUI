//
//  ViewController.swift
//  RateUI
//
//  Created by PC on 2/8/24.
//

import UIKit
import AperoUI

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
     @IBOutlet weak var reatingApp: RatingApp!
    override func viewDidLoad() {
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

        //        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        //        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //        blurEffectView.frame = view.bounds
        //        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        view.addSubview(blurEffectView)
        //        view.sendSubviewToBack(blurEffectView)
        //        view.backgroundColor = .black
        button.addTarget(self, action: #selector(presentView), for: .touchUpInside)
    }
    @objc func presentView(){
        let vc = BlurViewController(nibName: "BlurViewController", bundle: Bundle.AperoUI)
        self.present(vc, animated: true)
    }
}

