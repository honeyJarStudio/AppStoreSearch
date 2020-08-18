//
//  UIViewExtension.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setCornerRadius(of defaultRadius: CGFloat?) {
        var radius: CGFloat = 16.0
        if let newValue = defaultRadius {
            radius = newValue
        }
        self.layer.cornerRadius = radius
    }
}
