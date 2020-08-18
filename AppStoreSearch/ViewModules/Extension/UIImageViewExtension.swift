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
        let altImage = UIImage(systemName: "icloud.and.arrow.down")?.withTintColor(.secondaryLabel, renderingMode: .automatic)
        let failImage = UIImage(systemName: "exclamationmark.icloud")?.withTintColor(.secondaryLabel, renderingMode: .automatic)
        self.image = (placeholder == nil ? altImage : placeholder)
        guard let finalUrl = url else {
            self.image = failImage
            return
        }
        let task = URLSession.shared.dataTask(with: finalUrl)
            { data, _ , error in
                if let fail = error, data == nil {
                    // error
                    Logger.errorLog(fail.localizedDescription, prefix: "Image Loading, URL: \(finalUrl.absoluteString)")
                    // replace image with failure image
                    DispatchQueue.main.async
                        {
                            self.setImageWithAimation(image: failImage)
                    }
                    return
                }
                if let extracted = data {
                    let image = UIImage(data: extracted)
                    DispatchQueue.main.async
                        {
                            self.setImageWithAimation(image: image)
                    }
                }
            }
        GlobalImageRequest.addQueue(url: finalUrl.absoluteString, image: self, task: task)
        task.resume()
    }
    
    private func setImageWithAimation(image: UIImage?) {
        self.layer.opacity = 0.0
        self.image = image
        UIView.animate(withDuration: 0.4, animations:
            {
                self.layer.opacity = 1.0
        }
        )
    }
    
    func cancelRequest() {
        GlobalImageRequest.removeQueue(image: self)
    }
}
