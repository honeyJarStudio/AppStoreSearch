//
//  SearchResultCollectionDelegate.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/15.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class SearchResultCollectionDelegate: NSObject, CollectionViewHandler, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: Variables
    var appList: [AppData] = []
    
    //MARK: Constants
    private let sectionCount: Int = 1
    
    //MARK: Functions
    func setRequirements(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: AppBriefCell.identifier, bundle: nil), forCellWithReuseIdentifier: AppBriefCell.identifier)
//        collectionView.register(AppBriefCell.self, forCellWithReuseIdentifier: AppBriefCell.identifier)
    }
    
    //MARK: Implementations
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppBriefCell.identifier, for: indexPath) as? AppBriefCell
        let row = indexPath.row
        if row < self.appList.count {
            let app = self.appList[row]
            cell?.imageViewThumb.setImage(from: app.artworkUrl100)
            cell?.labelTitle.text = app.trackCensoredName
//            cell?.labelDescription.text = app.description
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.size.width
        let height: CGFloat = 80
        return CGSize(width: width, height: height)
    }
}
