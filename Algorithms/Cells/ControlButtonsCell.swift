//
//  ControlButtonsCell.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 18/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class ControlButtonsCell: UITableViewCell {
    
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    var delegate: ButtonDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.selectionStyle = .none
    }
    
    override func awakeFromNib() {
        setUpButton(button: mainButton)
        setUpButton(button: leftButton)
        setUpButton(button: rightButton)
        
    }
    
    func setUpButton(button: UIButton) {
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        button.layer.shadowColor = button.backgroundColor?.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 5
        
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = button.frame.height/2
        button.layer.masksToBounds = true
        button.backgroundColor = .blue
    }
    
    @objc func buttonPressed(sender: UIButton) {
        delegate?.buttonPressed(withTag: sender.tag)
    }
    
}
