//
//  MainViewCell.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        //contentView.backgroundColor = .white
    }
    
    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
