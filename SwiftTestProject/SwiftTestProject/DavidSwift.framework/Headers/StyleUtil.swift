//
//  StyleUtil.swift
//  BeeSmart
//
//  Created by 王恒振 on 2018/7/4.
//

import Foundation
import UIKit


//@IBDesignable
open class styleView: UIView{
    
    public enum ShadowPositionType: Int {
        case None = 0
        case Top
        case Bottom
        case BottomRight
    }
    
    @IBInspectable open var CornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = CornerRadius
            //layer.masksToBounds = CornerRadius > 0
        }
    }
    
    @IBInspectable open var BorderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = BorderWidth
        }
    }
    
    @IBInspectable open var BorderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = BorderColor.cgColor
        }
    }
    
    @IBInspectable public var ShadowType: Int = 0{
        didSet {
            switch ShadowType {
            case ShadowPositionType.Top.rawValue:
                layer.shadowOffset = CGSize(width: 0, height: -2)
                layer.shadowOpacity = 0.4
                layer.shadowRadius = 3.0
                layer.shadowColor = UIColor.black.cgColor
            case ShadowPositionType.Bottom.rawValue:
                layer.shadowOffset = CGSize(width: 0, height: 2)
                layer.shadowOpacity = 0.4
                layer.shadowRadius = 2.0
                layer.shadowColor = UIColor.black.cgColor
            case ShadowPositionType.BottomRight.rawValue:
                layer.shadowOffset = CGSize(width: 1, height: 2)
                layer.shadowOpacity = 0.3
                layer.shadowRadius = 2.0
                layer.shadowColor = UIColor.black.cgColor
            default:
                layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }
    
    @IBInspectable public var St1Top: String = "Top"{
        didSet {}
    }
    @IBInspectable public var St2Bottom: String = "Bottom"{
        didSet {}
    }
    @IBInspectable public var St3BottomRight: String = "BottomRight"{
        didSet {}
    }

//    @IBInspectable public var ShadowTopEnable: Bool = true {
//        didSet {
//            if ShadowTopEnable == true {
//                ShadowBottomEnable = false
//                ShadowBottomRightEnable = false
//
//                layer.shadowOffset = CGSize(width: 0, height: -2)
//                layer.shadowOpacity = 0.4
//                layer.shadowRadius = 3.0
//                layer.shadowColor = UIColor.black.cgColor
//            } else {
//                layer.shadowColor = UIColor.clear.cgColor
//            }
//        }
//    }
//    @IBInspectable public var ShadowBottomEnable: Bool = true {
//        didSet {
//            if ShadowBottomEnable == true {
//                ShadowTopEnable = false
//                ShadowBottomRightEnable = false
//
//                layer.shadowOffset = CGSize(width: 0, height: 2)
//                layer.shadowOpacity = 0.4
//                layer.shadowRadius = 2.0
//                layer.shadowColor = UIColor.black.cgColor
//            } else {
//                layer.shadowColor = UIColor.clear.cgColor
//            }
//        }
//    }
//    @IBInspectable public var ShadowBottomRightEnable: Bool = true {
//        didSet {
//            if ShadowBottomRightEnable == true {
//                ShadowTopEnable = false
//                ShadowBottomEnable = false
//
//                layer.shadowOffset = CGSize(width: 1, height: 2)
//                layer.shadowOpacity = 0.3
//                layer.shadowRadius = 2.0
//                layer.shadowColor = UIColor.black.cgColor
//            } else {
//                layer.shadowColor = UIColor.clear.cgColor
//            }
//        }
//    }
    
    @IBInspectable public var ShadowEnable: Bool = true {
        didSet {
            if ShadowEnable == true {
                layer.shadowOffset = CGSize(width: 0, height: 2)
                layer.shadowOpacity = 0.8
                layer.shadowRadius = 2.0
                layer.shadowColor = UIColor.black.cgColor
            } else {
                layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }

    @IBInspectable public var ShadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = ShadowColor.cgColor
        }
    }

    @IBInspectable public var ShadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            layer.shadowOffset = ShadowOffset
        }
    }

    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
}

//@IBDesignable

open class styleLabel: UILabel{
    
    @IBInspectable open var CornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = CornerRadius
            //layer.masksToBounds = CornerRadius > 0
        }
    }
    
    @IBInspectable open var BorderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = BorderWidth
        }
    }
    
    @IBInspectable open var BorderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = BorderColor.cgColor
        }
    }
}

//@IBDesignable

open class styleButton: UIButton{
    
    @IBInspectable open var CornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = CornerRadius
            //layer.masksToBounds = CornerRadius > 0
        }
    }
    
    @IBInspectable open var BorderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = BorderWidth
        }
    }
    
    @IBInspectable open var BorderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = BorderColor.cgColor
        }
    }

    @IBInspectable public var ShadowEnable: Bool = true {
        didSet {
            if ShadowEnable == true {
                layer.shadowOffset = CGSize(width: 0, height: 2)
                layer.shadowOpacity = 0.8
                layer.shadowRadius = 2.0
                layer.shadowColor = UIColor.black.cgColor
                
            } else {
                layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }
    
    @IBInspectable public var ShadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = ShadowColor.cgColor
        }
    }
    
    @IBInspectable public var ShadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            layer.shadowOffset = ShadowOffset
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
}


//@IBDesignable
class LDGradientView: UIView {
    
    // the gradient start colour
    @IBInspectable var startColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient end colour
    @IBInspectable var endColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient angle, in degrees anticlockwise from 0 (east/right)
    @IBInspectable var angle: CGFloat = 270 {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient layer
    private var gradient: CAGradientLayer?
    
    // initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }
    
    // Create a gradient and install it on the layer
    private func installGradient() {
        // if there's already a gradient installed on the layer, remove it
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = createGradient()
        self.layer.addSublayer(gradient)
        self.gradient = gradient
    }
    
    // Update an existing gradient
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor ?? UIColor.clear
            let endColor = self.endColor ?? UIColor.clear
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            let (start, end) = gradientPointsForAngle(self.angle)
            gradient.startPoint = start
            gradient.endPoint = end
        }
    }
    
    // create gradient layer
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    // create vector pointing in direction of angle
    private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint) {
        // get vector start and end points
        let end = pointForAngle(angle)
        //let start = pointForAngle(angle+180.0)
        let start = oppositePoint(end)
        // convert to gradient space
        let p0 = transformToGradientSpace(start)
        let p1 = transformToGradientSpace(end)
        return (p0, p1)
    }
    
    // get a point corresponding to the angle
    private func pointForAngle(_ angle: CGFloat) -> CGPoint {
        // convert degrees to radians
        let radians = angle * .pi / 180.0
        var x = cos(radians)
        var y = sin(radians)
        // (x,y) is in terms unit circle. Extrapolate to unit square to get full vector length
        if (abs(x) > abs(y)) {
            // extrapolate x to unit length
            x = x > 0 ? 1 : -1
            y = x * tan(radians)
        } else {
            // extrapolate y to unit length
            y = y > 0 ? 1 : -1
            x = y / tan(radians)
        }
        return CGPoint(x: x, y: y)
    }
    
    // transform point in unit space to gradient space
    private func transformToGradientSpace(_ point: CGPoint) -> CGPoint {
        // input point is in signed unit space: (-1,-1) to (1,1)
        // convert to gradient space: (0,0) to (1,1), with flipped Y axis
        return CGPoint(x: (point.x + 1) * 0.5, y: 1.0 - (point.y + 1) * 0.5)
    }
    
    // return the opposite point in the signed unit square
    private func oppositePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: -point.x, y: -point.y)
    }
    
    // ensure the gradient gets initialized when the view is created in IB
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        installGradient()
        updateGradient()
    }
}
