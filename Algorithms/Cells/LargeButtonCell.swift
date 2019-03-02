//
//  LargeButtonCell.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class LargeButtonCell: UITableViewCell {
    
    @IBOutlet var button: UIButton!
    
    var delegate: ButtonDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.selectionStyle = .none
    }
    
    override func awakeFromNib() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        //button.layer.shadowColor = UIColor.orange.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 4
        
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            button.layer.shadowColor = backgroundColor?.cgColor
        }
    }
    
    @objc func buttonPressed() {
        delegate?.buttonPressed(withTag: 0)
    }
    
}


