//
//  KeywordCollectionViewDelegate.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class KeywordCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, KeywordCellDelegate {
    
    var keywords: [String] = []
    var eventDelegate: KeywordDelegate?
    
    func setRequirements(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: KeywordCell.identifier, bundle: nil), forCellWithReuseIdentifier: KeywordCell.identifier)
    }
    
    //MARK: Functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCell.identifier, for: indexPath) as? KeywordCell else {
            return KeywordCell()
        }
        cell.delegate = self
        cell.indexPath = indexPath
        let row = indexPath.row
        if row < keywords.count {
            let keyword = self.keywords[row]
            cell.labelKeyword.text = keyword
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height: CGFloat = 44.0
        return .init(width: width, height: height)
    }
    
    func keywordClicked(index: IndexPath) {
        let row = index.row
        if row < self.keywords.count {
            let keyword = self.keywords[row]
            self.eventDelegate?.keywordSelected(keyword: keyword)
        }
    }
}

protocol KeywordDelegate {
    func keywordSelected(keyword: String)
}
