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
    
    //MARK: Constants
    static let identifier: String = "AppBriefCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageViewThumb.layer.cornerRadius = 10.0
    }
}
