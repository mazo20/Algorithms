//
//  AlgorithmViewController.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var toolbar: UIToolbar!
    
    fileprivate let algorithmCell = "AlgorithmCell"
    fileprivate let largeButtonCell = "LargeButtonCell"
    fileprivate let segmentedControlCell = "SegmentedControlCell"
    fileprivate let controlButtonsCell = "ControlButtonsCell"
    fileprivate let descriptionCell = "DescriptionCell"
    
    var algorithmDelegate: AlgorithmDelegate!
    var algorithmType: AlgorithmModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: algorithmCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: algorithmCell)
        nib = UINib(nibName: largeButtonCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: largeButtonCell)
        nib = UINib(nibName: segmentedControlCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: segmentedControlCell)
        nib = UINib(nibName: controlButtonsCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: controlButtonsCell)
        nib = UINib(nibName: descriptionCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: descriptionCell)
        nib = UINib(nibName: "ToolbarView", bundle: nil)
        let toolbarView = nib.instantiate(withOwner: self, options: nil).first as! ToolbarView
        
        algorithmDelegate = AlgorithmDelegate()
        
        //extendedLayoutIncludesOpaqueBars = true
        tableView.backgroundColor = .white
        
        toolbarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60 )
        toolbarView.leftButton.layer.cornerRadius = 20
        toolbarView.rightButton.layer.cornerRadius = 20
        
        toolbar.addSubview(toolbarView)
        toolbarView.delegate = algorithmDelegate
        algorithmDelegate.toolbarView = toolbarView
        
    }
}

extension AlgorithmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: segmentedControlCell, for: indexPath) as! SegmentedControlCell
                cell.segmentedControl.tintColor = .orange
                
                cell.segmentedControl.removeAllSegments()
                cell.segmentedControl.insertSegment(withTitle: "Slow", at: 0, animated: false)
                cell.segmentedControl.insertSegment(withTitle: "Normal", at: 1, animated: false)
                cell.segmentedControl.insertSegment(withTitle: "Fast", at: 2, animated: false)
                cell.segmentedControl.selectedSegmentIndex = 1
                cell.segmentedControl.layer.cornerRadius = cell.segmentedControl.frame.height/2
                cell.segmentedControl.layer.masksToBounds = true
                cell.segmentedControl.layer.borderColor = cell.segmentedControl.tintColor.cgColor
                cell.segmentedControl.layer.borderWidth = 1.0
                
                cell.delegate = algorithmDelegate
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: algorithmCell, for: indexPath) as! AlgorithmCell
                cell.algorithmView.dataSource = AlgorithmDataSource(type: algorithmType, numberOfItems: 50)
                algorithmDelegate.algorithmView = cell.algorithmView
                
                return cell
            default:
                return UITableViewCell()
            }
        case 1:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "complexity")
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = algorithmType.worstCaseName
                cell.detailTextLabel?.text = algorithmType.worstCase
            case 1:
                cell.textLabel?.text = algorithmType.averageCaseName
                cell.detailTextLabel?.text = algorithmType.averageCase
            case 2:
                cell.textLabel?.text = algorithmType.bestCaseName
                cell.detailTextLabel?.text = algorithmType.bestCase
            case 3:
                cell.textLabel?.text = algorithmType.stableName
                cell.detailTextLabel?.text = algorithmType.stable
            default:
                return UITableViewCell()
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: descriptionCell, for: indexPath) as! DescriptionCell
            cell.descriptionLabel.text = algorithmType.description
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 1:
                return 350
            case 2, 3:
                return 70
            default:
                return 50
            }
        case 1:
            return 44
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 1:
                return 350
            case 2, 3:
                return 70
            default:
                return 50
            }
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.00001
        default:
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let view = TableViewHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.sectionHeaderHeight))
            view.titleLabel?.text = "Complexity"
            return view
        case 2:
            let view = TableViewHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.sectionHeaderHeight))
            view.titleLabel?.text = "Description"
            return view
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.sectionFooterHeight))
        view.backgroundColor = .white
        return view
    }
}
