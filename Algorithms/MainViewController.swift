//
//  MainViewController.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    fileprivate let mainViewCell = "MainViewCell"
    fileprivate let showAlgorithmViewController = "ShowAlgorithmViewController"
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    
    fileprivate var selectedCell: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: mainViewCell, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: mainViewCell)
        
        title = "Algorithms"
        extendedLayoutIncludesOpaqueBars = true
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlgorithmModel.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainViewCell, for: indexPath) as! MainViewCell
        
        cell.titleLabel.text = AlgorithmModel.allCases[indexPath.row].title
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        cell.backgroundColor = AlgorithmModel.allCases[indexPath.row].color
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = indexPath.row
        performSegue(withIdentifier: showAlgorithmViewController, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AlgorithmViewController, let selectedCell = selectedCell else {
            print("Error getting AlgorithmViewController")
            return
        }
        vc.title = AlgorithmModel.allCases[selectedCell].title
        vc.algorithmType = AlgorithmModel.allCases[selectedCell]
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

