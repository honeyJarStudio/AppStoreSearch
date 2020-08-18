//
//  AppDetailPresenter.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class AppDetailPresenter: SuperPresenter, AppDetailEventHandler, AppDetailInteractorOutput {
    //MARK: Variables
    private var view: AppDetailViewInterface? { return super.getView(type: AppDetailViewController.self) }
    var wireframe: AppDetailWireframe?
    var appData: AppData?
    
    func setLayoutRequirements() {
        guard let app = self.appData else {
            Logger.errorLog("no app data found")
            return
        }
        self.view?.initializeViewsFromAppData(app: app)
        self.makeImageViews() // simultaneously do the screenshots job
    }
    
    private func makeImageViews() {
        guard let screenshots = self.appData?.screenshotUrls else {
            // no images
            self.view?.setScreenshots(images: [])
            return
        }
        var container: [UIImageView] = []
        for url in screenshots {
            let width = Constants.getScreenWidth() / 2
            let ratio = Constants.getScreenShotHeightMultiplier()
            let height = width * ratio
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.isUserInteractionEnabled = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.setImage(from: url)
            imageView.setCornerRadius(of: 32.0)
            container.append(imageView)
        }
        self.view?.setScreenshots(images: container)
    }
}
