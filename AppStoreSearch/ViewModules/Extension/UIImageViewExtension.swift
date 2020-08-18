//
//  UIImageViewExtensions.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/15.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(from urlString: String?) {
        guard let str = urlString, let url = URL(string: str) else {
            self.setImage(from: nil, withPlaceholder: nil)
            return
        }
        self.setImage(from: url, withPlaceholder: nil)
    }
    
    func setImage(from url: URL?, withPlaceholder placeholder: UIImage? = nil) {
        let altImage = UIImage(systemName: "icloud")?.withTintColor(.secondaryLabel, renderingMode: .alwaysTemplate)
        let failImage = UIImage(systemName: "icloud.slash")?.withTintColor(.secondaryLabel, renderingMode: .alwaysTemplate)
        self.image = (placeholder == nil ? altImage : placeholder)
        guard let finalUrl = url else {
            self.image = failImage
            return
        }
        URLSession.shared.dataTask(with: finalUrl)
        { data, _ , error in
            if let fail = error {
                // error
                Logger.errorLog(fail.localizedDescription, prefix: "Image Loading, URL: \(finalUrl.absoluteString)")
                // replace image with failure image
                DispatchQueue.main.async {
                    self.image = failImage
                }
                return
            }
            if let extracted = data {
                let image = UIImage(data: extracted)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
