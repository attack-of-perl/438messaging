//
//  DesignableView.swift
//  438messaging
//
//  Created by Zachary Perlman on 11/30/18.
//  Copyright © 2018 Zachary Perlman. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {

    var gradient:CAGradientLayer!
    
        
    @IBInspectable var topColor:UIColor = UIColor(red: 0.00, green: 0.20, blue: 0.40, alpha: 1.0){
        //003366
        didSet{
            setNeedsLayout()
        }
    }
    @IBInspectable var bottomColor:UIColor = UIColor(red:0.00, green:0.38, blue:0.67, alpha:1.0){
        //0061AC
        didSet{
            setNeedsLayout()
        }
    }
    @IBInspectable var startPoint:CGPoint = CGPoint(x:0, y:0){
        didSet{
            setNeedsLayout()
        }
    }
    @IBInspectable var endPoint:CGPoint = CGPoint(x:0, y:1){
        didSet{
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        self.gradient = self.layer as? CAGradientLayer
        self.gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        self.gradient.startPoint = startPoint
        self.gradient.endPoint = endPoint
    }
    override class var layerClass:AnyClass {
        return CAGradientLayer.self
    }
}
    
    //From: https://github.com/matvdg/Gradient-View/blob/master/GradientView.swift
    //And: https://hackernoon.com/color-it-with-gradients-ios-a4b374c3c79f


