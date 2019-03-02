//
//  SegmentedControlCell.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 18/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class SegmentedControlCell: UITableViewCell {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var delegate: SegmentedControlDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.selectionStyle = .none
    }
    
    override func awakeFromNib() {
        segmentedControl.addTarget(self, action: #selector(valueDidChange(sender:)), for: .valueChanged)
    }
    
    @objc func valueDidChange(sender: UISegmentedControl) {
        delegate?.valueDidChange(to: sender.selectedSegmentIndex)
    }
    
}
