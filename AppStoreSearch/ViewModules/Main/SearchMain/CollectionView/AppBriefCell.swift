//
//  AppBriefCell.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/15.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class AppBriefCell: UICollectionViewCell {
    
    //MARK: Variables
    var delegate: AppBriefCellDelegate?
    var index: IndexPath?
    
    //MARK: Outlet Variables
    @IBOutlet weak var imageViewThumb: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var stackViewRatings: UIStackView!
    @IBOutlet weak var imageViewStarFirst: UIImageView!
    @IBOutlet weak var imageViewStarSecond: UIImageView!
    @IBOutlet weak var imageViewStarThird: UIImageView!
    @IBOutlet weak var imageViewStarFourth: UIImageView!
    @IBOutlet weak var imageViewStarFifth: UIImageView!
    @IBOutlet weak var buttonAction: UIButton!
    @IBOutlet weak var stackViewScreenshots: UIStackView!
    @IBOutlet weak var imageViewFirst: UIImageView!
    @IBOutlet weak var imageViewSecond: UIImageView!
    @IBOutlet weak var imageViewThird: UIImageView!
    
    //MARK: Constants
    static let identifier: String = "AppBriefCell"
    static let maxWidthToExpand: CGFloat = 414.0
    static let estimatedHeightRatio: CGFloat = 414.0/370.0
    private let cornerRadiusDefualt: CGFloat = 16.0

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageViewThumb.setCornerRadius(of: self.cornerRadiusDefualt)
        self.buttonAction.setCornerRadius(of: self.buttonAction.frame.size.height/2)
        self.imageViewFirst.setCornerRadius(of: self.cornerRadiusDefualt)
        self.imageViewSecond.setCornerRadius(of: self.cornerRadiusDefualt)
        self.imageViewThird.setCornerRadius(of: self.cornerRadiusDefualt)
        let tap = UITapGestureRecognizer(target: self, action: #selector(contentClickAction))
        self.contentView.isUserInteractionEnabled = true
        self.contentView.addGestureRecognizer(tap)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.initialize()
    }
    
    func initialize() {
        self.imageViewThumb.cancelRequest()
        self.imageViewFirst.cancelRequest()
        self.imageViewSecond.cancelRequest()
        self.imageViewThird.cancelRequest()
        self.imageViewFirst.image = nil
        self.imageViewSecond.image = nil
        self.imageViewThird.image = nil
    }
    
    func setupRating(_ rating: CGFloat) {
        let starBlank = UIImage(systemName: "star")
        let starHalf = UIImage(systemName: "star.lefthalf.fill")
        let starFill = UIImage(systemName: "star.fill")
        let stars: [UIImageView] = [self.imageViewStarFirst, self.imageViewStarSecond, self.imageViewStarThird, self.imageViewStarFourth, self.imageViewStarFifth]
        for star in stars {
            star.image = starBlank
        }
        let floored = floor(rating)
        var overHalf: Bool = (rating - floored) >= 0.5
        var idxToReach = Int(floored) - 1
        if idxToReach > stars.count {
            idxToReach = stars.count
            overHalf = false
        }
        for idx in 0 ..< stars.count {
            let star = stars[idx]
            if idx <= idxToReach {
                star.image = starFill
            } else if idx == idxToReach + 1 && overHalf {
                star.image = starHalf
            } else {
                star.image = starBlank
            }
        }
    }
    
    @IBAction func openButtonClicked(_ sender: Any) {
        guard let index = self.index else {
            return
        }
        self.delegate?.openButtonClicked(index: index)
    }
    
    @objc func contentClickAction(_ sender: UITapGestureRecognizer) {
        guard let index = self.index else {
            return
        }
        self.delegate?.contentClicked(index: index)
    }
}

protocol AppBriefCellDelegate {
    func openButtonClicked(index: IndexPath)
    func contentClicked(index: IndexPath)
}
