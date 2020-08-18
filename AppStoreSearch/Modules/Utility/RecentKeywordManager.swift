//
//  RecentKeywordManager.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class RecentKeywordManager {
    
    //MARK: Variables
    private static var instance: RecentKeywordManager?
    private let keyForKeywords: String = "stringKeyForKeywordArray"
    private let maxValueForKeywords: Int = 100
    
    //MARK: Static Functions
    static func getInstance() -> RecentKeywordManager {
        if self.instance == nil {
            self.instance = RecentKeywordManager()
        }
        return self.instance!
    }
    
    //MARK: Functions
    private func getUserDefaults() -> UserDefaults {
        let userDefaults: UserDefaults = UserDefaults.standard
        return userDefaults
    }
    
    func addKeyword(_ keyword: String) {
        var array = self.getKeywords()
        for idx in 0 ..< array.count {
            if array[idx] == keyword {
                array.remove(at: idx)
                break
            }
        }
        array.insert(keyword, at: 0)
        if array.count > 100 {
            array.removeLast()
        }
        let obj = KeywordData()
        obj.keyword = array
        let data = NSKeyedArchiver.archivedData(withRootObject: obj)
        self.getUserDefaults().set(data, forKey: self.keyForKeywords)
    }
    
    func getKeywords() -> [String] {
        var keywords: [String] = []
        if let data = self.getUserDefaults().data(forKey: self.keyForKeywords) {
            if let converted = NSKeyedUnarchiver.unarchiveObject(with: data) as? KeywordData, let array = converted.keyword {
                keywords = array
            }
        }
        return keywords
    }
}
