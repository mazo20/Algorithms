//
//  TableViewHeader.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 25/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class TableViewHeader: UIView {
    
    var titleLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        let separator = UIView(frame: CGRect(x: 20, y: 0, width: frame.width - 40, height: 1))
        separator.backgroundColor = #colorLiteral(red: 0.8405452371, green: 0.8405452371, blue: 0.8405452371, alpha: 1)
        
        titleLabel = UILabel()
        titleLabel!.frame = CGRect(x: 20, y: 10, width: 250, height: 30)
        titleLabel!.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        self.addSubview(titleLabel!)
        self.addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
