//
//  GlobalDispatchGroup.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class GlobalImageRequest {
    
    private static var images: [Int : String] = [ : ]
    private static var imageTasks: [String : URLSessionDataTask] = [ : ]
    
    static func addQueue(url: String, image: UIImageView, task: URLSessionDataTask) {
        self.images[image.hash] = url
        self.addTask(url: url, task: task)
    }
    
    static func removeQueue(image: UIImageView) {
        if let key = self.images[image.hash] {
            self.killTask(url: key)
            self.images.removeValue(forKey: image.hash)
        }
    }
    
    private static func addTask(url: String, task: URLSessionDataTask) {
        self.imageTasks[url] = task
    }
    
    private static func killTask(url: String) {
        if let task = self.imageTasks[url] {
            task.cancel()
            self.imageTasks.removeValue(forKey: url)
        }
    }
}
