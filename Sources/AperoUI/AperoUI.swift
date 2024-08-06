// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import UIKit


extension Bundle {
    public static var AperoUI: Bundle = .module
}
extension UIView {
func borders(for edges:[UIRectEdge], width:CGFloat = 1, color: UIColor = .black) {

    if edges.contains(.all) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    } else {
        let allSpecificBorders:[UIRectEdge] = [.top, .bottom, .left, .right]

        for edge in allSpecificBorders {
            if let v = viewWithTag(Int(edge.rawValue)) {
                v.removeFromSuperview()
            }

            if edges.contains(edge) {
                let v = UIView()
                v.tag = Int(edge.rawValue)
                v.backgroundColor = color
                v.translatesAutoresizingMaskIntoConstraints = false
                addSubview(v)

                var horizontalVisualFormat = "H:"
                var verticalVisualFormat = "V:"

                switch edge {
                case UIRectEdge.bottom:
                    horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                    verticalVisualFormat += "[v(\(width))]-(0)-|"
                case UIRectEdge.top:
                    horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                    verticalVisualFormat += "|-(0)-[v(\(width))]"
                case UIRectEdge.left:
                    horizontalVisualFormat += "|-(0)-[v(\(width))]"
                    verticalVisualFormat += "|-(0)-[v]-(0)-|"
                case UIRectEdge.right:
                    horizontalVisualFormat += "[v(\(width))]-(0)-|"
                    verticalVisualFormat += "|-(0)-[v]-(0)-|"
                default:
                    break
                }

                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": v]))
                self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": v]))
            }
        }
    }
  }
}

extension UIColor {
  
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}
