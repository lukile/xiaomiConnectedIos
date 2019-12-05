//
//  UIIMageView.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 05/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
