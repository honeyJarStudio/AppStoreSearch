//
//  KeywordCell.swift
//  AppStoreSearch
//
//  Created by 이정환 on 2020/08/18.
//  Copyright © 2020 RYAN. All rights reserved.
//

import Foundation
import UIKit

class KeywordCell: UICollectionViewCell {
    
    @IBOutlet weak var labelKeyword: UILabel!
    static let identifier: String = "KeywordCell"
    var indexPath: IndexPath?
    var delegate: KeywordCellDelegate?
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(contentTapped))
        self.contentView.isUserInteractionEnabled = true
        self.contentView.addGestureRecognizer(tap)
    }
    
    @objc func contentTapped(_ sender: UITapGestureRecognizer) {
        guard let index = self.indexPath else {
            return
        }
        self.delegate?.keywordClicked(index: index)
    }
    
}

protocol KeywordCellDelegate {
    func keywordClicked(index: IndexPath)
}
