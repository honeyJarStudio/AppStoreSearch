//
//  AppDetailViewController.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class AppDetailViewController: SuperViewController<SuperPresenter>, AppDetailViewInterface {
    
    //MARK: Variables
    private var eventHandler: AppDetailEventHandler? { return super.getEventHandler(type: AppDetailPresenter.self) }
    private var appData: AppData?
    
    //MARK: Outlet Variables
    @IBOutlet weak var viewTopContainer: UIView!
    @IBOutlet weak var viewRatingCategoryContainer: UIView!
    @IBOutlet weak var viewNewFeatureContainer: UIView!
    @IBOutlet weak var viewPreviewContainer: UIView!
    @IBOutlet weak var scrollViewScreenshots: UIScrollView!
    @IBOutlet weak var viewDescriptionContainer: UIView!
    @IBOutlet weak var viewDeveloperContainer: UIView!
    @IBOutlet weak var viewReviewContainer: UIView!
    @IBOutlet weak var viewInformationContainer: UIView!
    @IBOutlet weak var viewDevWebContainer: UIView!
    @IBOutlet weak var imageViewLargeThumb: UIImageView!
    @IBOutlet weak var labelAppName: UILabel!
    @IBOutlet weak var labelAppDescription: UILabel!
    @IBOutlet weak var buttonOpen: UIButton!
    @IBOutlet weak var buttonShare: UIButton!
    @IBOutlet weak var labelRatingTopSmall: UILabel!
    @IBOutlet weak var labelRatingTopSmallDesc: UILabel!
    @IBOutlet weak var labelRankTopSmall: UILabel!
    @IBOutlet weak var labelRankTopSmallDesc: UILabel!
    @IBOutlet weak var labelAgeTopSmall: UILabel!
    @IBOutlet weak var labelAgeTopSmallDesc: UILabel!
    @IBOutlet weak var labelTitleNewFeature: UILabel!
    @IBOutlet weak var labelFeatureVersionName: UILabel!
    @IBOutlet weak var labelFeatureReleaseNote: UILabel!
    @IBOutlet weak var buttonFeatureMore: UIButton!
    @IBOutlet weak var labelTitlePreviews: UILabel!
    @IBOutlet weak var labelDescriptionDetail: UILabel!
    @IBOutlet weak var buttonDescriptionDetailMore: UIButton!
    @IBOutlet weak var buttonDeveloperName: UIButton!
    @IBOutlet weak var labelDeveloperNameDesc: UILabel!
    @IBOutlet weak var buttonDeveloperNameArrow: UIButton!
    @IBOutlet weak var labelTitleReviews: UILabel!
    @IBOutlet weak var labelReviewsRatingsLarge: UILabel!
    @IBOutlet weak var labelReviewsRatingsLargeDesc: UILabel!
    @IBOutlet weak var labelReviewsTotalCount: UILabel!
    @IBOutlet weak var labelTitleInformation: UILabel!
    @IBOutlet weak var labelInfoDeveloper: UILabel!
    @IBOutlet weak var labelInfoDeveloperValue: UILabel!
    @IBOutlet weak var labelInfoSize: UILabel!
    @IBOutlet weak var labelInfoSizeValue: UILabel!
    @IBOutlet weak var labelInfoCategory: UILabel!
    @IBOutlet weak var labelInfoCategoryValue: UILabel!
    @IBOutlet weak var labelInfoCompatibility: UILabel!
    @IBOutlet weak var labelInfoCompatibilityValue: UILabel!
    @IBOutlet weak var labelInfoLanguage: UILabel!
    @IBOutlet weak var labelInfoLanguageValue: UILabel!
    @IBOutlet weak var labelInfoAge: UILabel!
    @IBOutlet weak var labelInfoAgeValue: UILabel!
    @IBOutlet weak var labelInfoCopyright: UILabel!
    @IBOutlet weak var labelInfoCopyrightValue: UILabel!
    @IBOutlet weak var labelInfoDevWebsite: UILabel!
    @IBOutlet weak var buttonInfoDevWebsite: UIButton!
    
    @IBOutlet weak var imageViewStarFirst: UIImageView!
    @IBOutlet weak var imageViewStarSecond: UIImageView!
    @IBOutlet weak var imageViewStarThird: UIImageView!
    @IBOutlet weak var imageViewStarFourth: UIImageView!
    @IBOutlet weak var imageViewStarFifth: UIImageView!
    
    @IBOutlet weak var constScrollViewHeight: NSLayoutConstraint!
    
    //MARK: OverridenFunctions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.eventHandler?.setLayoutRequirements()
    }
    
    //MARK: ViewInterface
    func initializeViewsFromAppData(app: AppData) {
        self.appData = app
        var artwork = app.artworkUrl512
        if artwork == nil {
            artwork = app.artworkUrl100
        }
        self.imageViewLargeThumb.setImage(from: artwork)
        self.imageViewLargeThumb.setCornerRadius(of: 32.0)
        self.buttonOpen.setCornerRadius(of: self.buttonOpen.frame.size.height/2)
        self.labelAppName.text = app.trackName
        self.labelAppDescription.text = app.artistName
        self.buttonOpen.setTitle("열기", for: .normal)
        var rating = "0.0"
        if let rate = app.averageUserRating {
            let rounded = round(rate * 10) / 10
            self.setupRating(CGFloat(rounded))
            rating = "\(rounded)"
        }
        self.labelRatingTopSmall.text = rating
        self.labelReviewsRatingsLarge.text = rating
        var count: Int = 0
        if let ratingCount = app.userRatingCountForCurrentVersion {
            count = ratingCount
        } else if let ratingCount = app.userRatingCount {
            count = ratingCount
        }
        let countString = "\(count)개의 평가"
        self.labelRatingTopSmallDesc.text = countString
        self.labelReviewsTotalCount.text = countString
        self.labelRankTopSmall.text = "#1"
        self.labelRankTopSmallDesc.text = app.primaryGenreName ?? "Unknown"
        self.labelAgeTopSmall.text = app.trackContentRating ?? "Unknown"
        self.labelTitleNewFeature.text = "새로운 기능"
        self.labelFeatureVersionName.text = app.version ?? "Unknown"
        self.labelFeatureReleaseNote.text = app.releaseNotes ?? ""
        self.buttonFeatureMore.setTitle("더보기", for: .normal)
        self.labelTitlePreviews.text = "미리보기"
        self.labelDescriptionDetail.text = app.description ?? "없음"
        self.buttonDescriptionDetailMore.setTitle("더보기", for: .normal)
        self.buttonDeveloperName.setTitle(app.artistName ?? "Unknown", for: .normal)
        self.buttonDeveloperName.isUserInteractionEnabled = false
        self.labelDeveloperNameDesc.text = "개발자"
        self.buttonDeveloperNameArrow.isUserInteractionEnabled = false
        self.viewDeveloperContainer.isUserInteractionEnabled = true
        self.labelInfoDevWebsite.isUserInteractionEnabled = false
        self.buttonInfoDevWebsite.isUserInteractionEnabled = false
        self.viewDevWebContainer.isUserInteractionEnabled = true
        let dev = UITapGestureRecognizer(target: self, action: #selector(goToDeveloperWebsite))
        self.viewDevWebContainer.addGestureRecognizer(dev)
        let devCopy = UITapGestureRecognizer(target: self, action: #selector(goToDeveloperWebsite))
        self.viewDeveloperContainer.addGestureRecognizer(devCopy)
        self.labelTitleReviews.text = "평가 및 리뷰"
        self.labelReviewsRatingsLargeDesc.text = "(최고 5점)"
        self.labelTitleInformation.text = "정보"
        self.labelInfoDeveloper.text = "제공자"
        self.labelInfoDeveloperValue.text = app.sellerName ?? "Unknown"
        self.labelInfoSize.text = "크기"
        var size = "0.0"
        if let byte = app.fileSizeBytes {
            size = ByteCountFormatter.string(fromByteCount: Int64(byte) ?? 0, countStyle: .file)
        }
        self.labelInfoSizeValue.text = size
        self.labelInfoCategory.text = "카테고리"
        self.labelInfoCategoryValue.text = app.primaryGenreName ?? "Unknown"
        self.labelInfoCompatibility.text = "호환성"
        self.labelInfoCompatibilityValue.text = "이 iPhone와(과) 호환"
        self.labelInfoLanguage.text = "언어"
        var lang = "기타"
        if let codes = app.languageCodesISO2A {
            if codes.contains("KO") {
                lang = "한국어"
            }
        }
        self.labelInfoLanguageValue.text = lang
        self.labelInfoAge.text = "연령 등급"
        self.labelInfoAgeValue.text = app.contentAdvisoryRating ?? "Unknown"
        self.labelInfoCopyright.text = "저작권"
        self.labelInfoCopyrightValue.text = app.sellerName ?? "Unknown"
        self.labelInfoDevWebsite.text = "개발자 웹 사이트"
    }
    
    func setScreenshots(images: [UIImageView]) {
        for view in self.scrollViewScreenshots.subviews {
            view.removeFromSuperview()
        }
        let spacing: CGFloat = 8.0
        let width = self.scrollViewScreenshots.frame.size.width / 1.8
        let height = width * Constants.getScreenShotHeightMultiplier()
        self.constScrollViewHeight.constant = height
        var xPosition: CGFloat = 0.0
        for idx in 0 ..< images.count {
            let image = images[idx]
            if idx > 0 {
                xPosition = xPosition + width + spacing
            }
            image.frame = CGRect(x: xPosition, y: 0, width: width, height: height)
            self.scrollViewScreenshots.addSubview(image)
        }
        self.scrollViewScreenshots.contentSize = CGSize(width: xPosition + width, height: height)
    }
    
    //MARK: Functions
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
    
    @objc func goToDeveloperWebsite(_ sender: UITapGestureRecognizer) {
        // go to dev website
        let urlString = self.appData?.sellerUrl
        super.openURL(address: urlString, failMessage: "주소를 열 수 없습니다.")
    }
    
    @IBAction func openButtonClicked(_ sender: Any) {
        self.openApps()
    }
    
    @IBAction func shareButtonClicked(_ sender: Any) {
        guard let id = self.appData?.trackId else {
            self.showAlertPopupWithCloseButton(title: nil, message: "앱 정보가 없습니다.", closeMessage: nil, buttonHandler: nil)
            return
        }
        let url = Constants.getAppStoreWebUrlWithID(id: id)
        //Set the default sharing message.
        if let link = URL(string: url) {
            let objectsToShare = [link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = []
//            activityVC.modalPresentationStyle = .popover
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func openApps() {
        guard let id = self.appData?.trackId else {
            self.showAlertPopupWithCloseButton(title: nil, message: "앱 정보가 없습니다.", closeMessage: nil, buttonHandler: nil)
            return
        }
        let url = Constants.getAppUrlWithID(id: id)
        super.openURL(address: url, failMessage: "앱을 열 수 없습니다.")
    }
}
