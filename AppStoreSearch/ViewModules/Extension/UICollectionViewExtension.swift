//
//  UICollectionViewExtension.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/16.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func refreshData() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
