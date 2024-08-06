//
//  RatingApp.swift
//  
//
//  Created by PC on 2/8/24.
//

import UIKit

public class RatingApp: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconAppImageView: UIImageView!
    @IBOutlet weak var titleAppLable: UILabel!
    @IBOutlet weak var contentAppLable: UILabel!
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var rateUsButton: UIButton!
    @IBOutlet weak var rateContainStackView: UIView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    var onRate: ((Int) -> Void)?
    
    /// get star value when user chose star
    public var starRate = 0
    
    ///set selected image when user click star
    let selectedImageButton = UIImage(resource: .icStarSelected).withRenderingMode(.alwaysOriginal)
    
    ///set star normal image of button
    let normalImageButton = UIImage(resource: .icStar ).withRenderingMode(.alwaysOriginal)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView(){
        Bundle.AperoUI.loadNibNamed("RatingApp", owner: self)
        backgroundColor = .clear
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.layer.cornerRadius = 14
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        rateContainStackView.borders(for: [.top, .bottom], width: 0.33, color: UIColor("3C3C43", alpha: 0.36))
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setButton()
        setUpBlur()
        handleRateUs()
    }
    private func setButton(){
        button1.setImage(normalImageButton, for: .normal)
        button2.setImage(normalImageButton, for: .normal)
        button3.setImage(normalImageButton, for: .normal)
        button4.setImage(normalImageButton, for: .normal)
        button5.setImage(normalImageButton, for: .normal)
    }
    
    private func setUpBlur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = contentView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(blurEffectView)
        contentView.sendSubviewToBack(blurEffectView)
    }
    
    private func handleRateUs(){
        rateUsButton.addTarget(self, action: #selector(rateUsHandle), for: .touchUpInside)
    }
    @objc private func rateUsHandle(){
        onRate?(starRate)
    }
    @IBAction func handleActionclickStar(_ sender: UIButton) {
      
        switch sender{
        case button1:
            button1.setImage(selectedImageButton, for: .normal)
            button2.setImage(normalImageButton, for: .normal)
            button3.setImage(normalImageButton, for: .normal)
            button4.setImage(normalImageButton, for: .normal)
            button5.setImage(normalImageButton, for: .normal)
            starRate = 1
        case button2:
            button1.setImage(selectedImageButton, for: .normal)
            button2.setImage(selectedImageButton, for: .normal)
            button3.setImage(normalImageButton, for: .normal)
            button4.setImage(normalImageButton, for: .normal)
            button5.setImage(normalImageButton, for: .normal)
            starRate = 2
        case button3:
            button1.setImage(selectedImageButton, for: .normal)
            button2.setImage(selectedImageButton, for: .normal)
            button3.setImage(selectedImageButton, for: .normal)
            button4.setImage(normalImageButton, for: .normal)
            button5.setImage(normalImageButton, for: .normal)
            starRate = 3
        case button4:
            button1.setImage(selectedImageButton, for: .normal)
            button2.setImage(selectedImageButton, for: .normal)
            button3.setImage(selectedImageButton, for: .normal)
            button4.setImage(selectedImageButton, for: .normal)
            button5.setImage(normalImageButton, for: .normal)
            starRate = 4

        case button5:
            button1.setImage(selectedImageButton, for: .normal)
            button2.setImage(selectedImageButton, for: .normal)
            button3.setImage(selectedImageButton, for: .normal)
            button4.setImage(selectedImageButton, for: .normal)
            button5.setImage(selectedImageButton, for: .normal)
            starRate = 5

        default:
            break
        }
    }
    
    /// use update icon is ImageView for rating app
    @discardableResult
    public func configIconApp(_ config: (UIImageView) -> Void) -> Self {
        config(iconAppImageView)
        return self
    }
    
    /// use update title is lable for rating app
    @discardableResult
    public func configTitleLable(_ config: (UILabel) -> Void) -> Self {
        config(titleAppLable)
        return self
    }
    
    /// use update content is lable for rating app
    @discardableResult
    public func configContentLable(_ config: (UILabel) -> Void) -> Self {
        config(contentAppLable)
        return self
    }
    
     /// use handle rate us  is button for rating app
    @discardableResult
    public func configRateUsButton(_ config: (UIButton) -> Void) -> Self {
        config(rateUsButton)
        return self
    }
    
    @discardableResult
    public func configRateButtonStackView(_ config: (UIStackView) -> Void) -> Self {
        config(starStackView)
        return self
    }
    
    /// get value of star
    @discardableResult
    public func onRate(_ config: @escaping (Int) -> Void) -> Self {
        self.onRate = config
        return self
    }
}
