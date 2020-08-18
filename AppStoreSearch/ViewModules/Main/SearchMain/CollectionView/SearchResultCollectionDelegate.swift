//
//  SearchResultCollectionDelegate.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/15.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class SearchResultCollectionDelegate: NSObject, CollectionViewHandler, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AppBriefCellDelegate {
    
    //MARK: Variables
    var appList: [AppData] = []
    var eventDelegate: SearchResultDelegateEvent?
    
    //MARK: Constants
    private let sectionCount: Int = 1
    
    //MARK: Functions
    func setRequirements(collectionView: UICollectionView) {
        //        collectionView.register(AppBriefCell.self, forCellWithReuseIdentifier: AppBriefCell.identifier)
        collectionView.register(UINib(nibName: AppBriefCell.identifier, bundle: nil), forCellWithReuseIdentifier: AppBriefCell.identifier)
    }
    
    //MARK: Implementations
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppBriefCell.identifier, for: indexPath) as? AppBriefCell else {
            return UICollectionViewCell(frame: CGRect.zero)
        }
        let row = indexPath.row
        if row < self.appList.count {
            cell.delegate = self
            cell.index = indexPath
            let app = self.appList[row]
            cell.imageViewThumb.setImage(from: app.artworkUrl100)
            cell.labelTitle.text = app.trackCensoredName
            cell.labelDescription.text = app.description
            if let ratingPoint = app.averageUserRating {
                cell.setupRating(CGFloat(ratingPoint))
            }
            guard let urls = app.screenshotUrls else {
                return cell
            }
            cell.imageViewFirst.setImage(from: urls.count > 0 ? urls[0] : nil)
            cell.imageViewSecond.setImage(from: urls.count > 1 ? urls[1] : nil)
            cell.imageViewThird.setImage(from: urls.count > 2 ? urls[2] : nil)
            let imageViews: [UIImageView] = [cell.imageViewFirst, cell.imageViewSecond, cell.imageViewThird]
            for view in imageViews {
                if let image = view.image, let cgi = view.image?.cgImage, image.size.width > image.size.height {
                    // landscape
                    let newOne = UIImage(cgImage: cgi, scale: image.scale, orientation: .left)
                    view.image = newOne
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.frame.size.width
        if width > AppBriefCell.maxWidthToExpand {
            width = AppBriefCell.maxWidthToExpand
        }
        let height = width * AppBriefCell.estimatedHeightRatio
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func openButtonClicked(index: IndexPath) {
        let row = index.row
        if self.appList.count > row, let id = self.appList[row].trackId, let url = URL(string: Constants.getAppUrlWithID(id: id)) {
            self.eventDelegate?.openUrlAction(url: url)
        }
    }
    
    func contentClicked(index: IndexPath) {
        let row = index.row
        if self.appList.count > row {
            let app = appList[row]
            self.eventDelegate?.browseAppAction(app: app)
        }
    }
}

protocol SearchResultDelegateEvent {
    func openUrlAction(url: URL)
    func browseAppAction(app: AppData)
}
