//
//  ToolbarView.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 20/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class ToolbarView: UIView {
    
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    var delegate: ButtonDelegate?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        self.contentMode = .redraw
        leftButton.backgroundColor = .orange
        rightButton.backgroundColor = .orange
        leftButton.tag = 0
        rightButton.tag = 1
        leftButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(sender: UIButton) {
        delegate?.buttonPressed(withTag: sender.tag)
    }
}
