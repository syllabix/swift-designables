//
//  BorderedView.swift
//  Swift Designables
//
//  Created by Tom Stoepker on 4/26/16.
//  Copyright © 2016 CrushOnly. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedView: UIView {
    
    @IBInspectable var topThickness: CGFloat = 0 {
        didSet {
            drawTopBorder()
        }
    }
    
    @IBInspectable var topColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            drawTopBorder()
        }
    }
    
    private weak var topBorder: CAShapeLayer?
    
    private func drawTopBorder() {
        let from = CGPoint(x: 0, y: 0)
        let here = CGPoint(x: bounds.width, y: 0)
        removeIfNeeded(topBorder)
        topBorder = addBorder(start: from, end: here, color: topColor, thickness: topThickness)
    }
    
    @IBInspectable var leftThickness: CGFloat = 0 {
        didSet {
            drawLeftBorder()
        }
    }
    
    @IBInspectable var leftColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            drawLeftBorder()
        }
    }
    
    private weak var leftBorder: CAShapeLayer?
    
    private func drawLeftBorder() {
        let from = CGPoint(x: 0, y: 0)
        let here = CGPoint(x: 0, y: bounds.height)
        removeIfNeeded(leftBorder)
        leftBorder = addBorder(start: from, end: here, color: leftColor, thickness: leftThickness)
    }
    
    @IBInspectable var rightThickness: CGFloat = 0 {
        didSet {
            drawRightBorder()
        }
    }
    
    @IBInspectable var rightColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            drawRightBorder()
        }
    }
    
    private weak var rightBorder: CAShapeLayer?
    
    private func drawRightBorder() {
        let from = CGPoint(x: bounds.width, y: 0)
        let here = CGPoint(x: bounds.width, y: bounds.height)
        removeIfNeeded(rightBorder)
        rightBorder = addBorder(start: from, end: here, color: rightColor, thickness: rightThickness)
    }
    
    @IBInspectable var bottomThickness: CGFloat = 0 {
        didSet {
            drawBottomBorder()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            drawBottomBorder()
        }
    }
    
    private weak var bottomBorder: CAShapeLayer?
    
    private func drawBottomBorder() {
        let from = CGPoint(x: 0, y: bounds.height)
        let here = CGPoint(x: bounds.width, y: bounds.height)
        removeIfNeeded(bottomBorder)
        bottomBorder = addBorder(start: from, end: here, color: bottomColor, thickness: bottomThickness)
    }
    
    private func removeIfNeeded(border: CAShapeLayer?) {
        if let bdr = border {
            bdr.removeFromSuperlayer()
        }
    }
    
    private func addBorder(start start: CGPoint, end: CGPoint, color: UIColor, thickness: CGFloat) -> CAShapeLayer {
            let border = CAShapeLayer()
            let path = UIBezierPath()
            path.moveToPoint(start)
            path.addLineToPoint(end)
            border.path = path.CGPath
            border.strokeColor = color.CGColor
            border.lineWidth = thickness
            border.fillColor = nil
            layer.addSublayer(border)
            return border
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawTopBorder()
        drawRightBorder()
        drawBottomBorder()
        drawLeftBorder()
    }

}
