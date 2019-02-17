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
    }
    
    @objc func buttonPressed() {
        delegate?.buttonPressed()
    }
    
}


