//
//  AlgorithmViewController.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmViewController: UITableViewController {
    
    fileprivate let algorithmCell = "AlgorithmCell"
    fileprivate let largeButtonCell = "LargeButtonCell"
    
    var algorithmDelegate: AlgorithmDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: algorithmCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: algorithmCell)
        nib = UINib(nibName: largeButtonCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: largeButtonCell)
        
        algorithmDelegate = AlgorithmDelegate()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: algorithmCell, for: indexPath) as! AlgorithmCell
            cell.algorithmView.dataSource = AlgorithmDataSource(type: .bubbleSort, numberOfItems: 50)
            algorithmDelegate.algorithmView = cell.algorithmView
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: largeButtonCell, for: indexPath) as! LargeButtonCell
            cell.delegate = algorithmDelegate
            cell.button.backgroundColor = .blue
            cell.button.setTitleColor(.white, for: .normal)
            cell.button.layer.cornerRadius = cell.button.frame.height/2
            cell.button.setTitle("Sort", for: .normal)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        default:
            return 70
        }
    }
    
}
