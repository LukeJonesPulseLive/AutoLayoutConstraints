//
//  File.swift
//  AutoLayout
//
//  Created by Andrew Robinson on 01/03/2018.
//  Copyright © 2018 Andrew Robinson. All rights reserved.
//

import UIKit

enum LayoutAnchor: String {
    case top
    case left
    case bottom
    case right
    case height
    case width
}

extension Array where Element: NSLayoutConstraint {
    subscript(anchor: LayoutAnchor) -> NSLayoutConstraint? {
        switch anchor {
        case .top:
            return self.filter { $0.identifier == LayoutAnchor.top.rawValue }.first
        case .bottom:
            return self.filter { $0.identifier == LayoutAnchor.bottom.rawValue }.first
        case .left:
            return self.filter { $0.identifier == LayoutAnchor.left.rawValue }.first
        case .right:
            return self.filter { $0.identifier == LayoutAnchor.right.rawValue }.first
        case .height:
            return self.filter { $0.identifier == LayoutAnchor.height.rawValue }.first
        case .width:
            return self.filter { $0.identifier == LayoutAnchor.width.rawValue }.first
        }
    }
}

extension UIView {
    
    public func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        
        _ = anchorWithReturnAnchors(top: top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant, widthConstant: widthConstant, heightConstant: heightConstant)
    }
    
    public func anchorWithReturnAnchors(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            let anchor = topAnchor.constraint(equalTo: top, constant: topConstant)
            anchor.identifier = LayoutAnchor.top.rawValue
            anchors.append(anchor)
        }
        
        if let left = left {
            let anchor = leftAnchor.constraint(equalTo: left, constant: leftConstant)
            anchor.identifier = LayoutAnchor.left.rawValue
            anchors.append(anchor)
        }
        
        if let bottom = bottom {
            let anchor = bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant)
            anchor.identifier = LayoutAnchor.bottom.rawValue
            anchors.append(anchor)
        }
        
        if let right = right {
            let anchor = rightAnchor.constraint(equalTo: right, constant: -rightConstant)
            anchor.identifier = LayoutAnchor.right.rawValue
            anchors.append(anchor)
        }
        
        if widthConstant > 0 {
            let anchor = widthAnchor.constraint(equalToConstant: widthConstant)
            anchor.identifier = LayoutAnchor.width.rawValue
            anchors.append(anchor)
        }
        
        if heightConstant > 0 {
            let anchor = heightAnchor.constraint(equalToConstant: heightConstant)
            anchor.identifier = LayoutAnchor.height.rawValue
            anchors.append(anchor)
        }
        
        anchors.forEach{
            $0.isActive = true
        }
        
        return anchors
    }
    
    public func fillSuperview() {
        if let superview = superview {
            anchor(superview.topAnchor, left: superview.leftAnchor, bottom: superview.bottomAnchor, right: superview.rightAnchor)
        }
    }
}


