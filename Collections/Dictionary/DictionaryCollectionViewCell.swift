//
//  CollectionViewCell.swift
//  Collections
//
//  Created by Константин Канюка on 18.08.2022.
//

import UIKit

class DictionaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var dictionaryCellLabel: UILabel!
    @IBOutlet var dictionaryActivityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dictionaryCellLabel.isHidden = false
        dictionaryActivityIndicator.stopAnimating()
        dictionaryActivityIndicator.isHidden = true
    }
    
    func configure(withOperation operation: Operation) {
        switch operation.state {
        case .initial:
            dictionaryCellLabel.isHidden = false
            dictionaryActivityIndicator.isHidden = true
            dictionaryCellLabel.text = operation.name
            dictionaryCellLabel.textColor = UIColor.systemBlue
        case .computing:
            dictionaryCellLabel.isHidden = true
            dictionaryActivityIndicator.isHidden = false
            dictionaryActivityIndicator.startAnimating()
        case .computed:
            dictionaryCellLabel.isHidden = false
            dictionaryActivityIndicator.stopAnimating()
            dictionaryActivityIndicator.isHidden = true
            dictionaryCellLabel.text = operation.name + " " + (operation.output ?? "?")
            dictionaryCellLabel.textColor = UIColor.black
        }
    }
}

    
    

