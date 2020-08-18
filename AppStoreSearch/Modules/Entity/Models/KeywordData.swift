//
//  KeywordData.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation

class KeywordData: NSObject, NSCoding {
    
    // MARK: Variables
    var keyword: [String]?
    
    // MARK: Constants
    private let keyForKeyword: String = "keyword"
    
    // MARK: Functions
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.keyword = aDecoder.decodeObject(forKey: self.keyForKeyword) as? [String]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.keyword, forKey: self.keyForKeyword)
    }
}
