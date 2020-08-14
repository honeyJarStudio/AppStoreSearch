//
//  ViewController.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/12.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class GatewayViewController: SuperViewController<GatewayPresenter>, GatewayViewInterface{
    
    private var eventHandler: GatewayEventHandler? {
        return self.getEventHandler(type: GatewayPresenter.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
