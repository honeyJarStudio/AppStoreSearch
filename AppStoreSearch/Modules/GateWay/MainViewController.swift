//
//  ViewController.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let keyword = "카카오뱅크".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let urlString = "https://itunes.apple.com/search?term=\(keyword)&entity=software&language=\("ko")"
//        let urlString = "https://www.naver.com"
        let request = URLRequest(url: URL(string: urlString)!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: .zero)
        let session = URLSession.shared.dataTask(with: request, completionHandler:
        { data, response, error in
            if let _ = error {
                // error
                Logger.errorLog("this is error")
                return
            }
            
            if let result = String(data: data!, encoding: .utf8), let app: AppSearchResult = AppSearchResult.map(json: result) {
                Logger.infoLog("success")
                Logger.infoLog("\(app.results?.first?.screenshotUrls?.first)")
            }
        }
        )
        session.resume()
        Parameter().test()
    }
}
