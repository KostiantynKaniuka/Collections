//
//  ArrayCollectionViewCell.swift
//  Collections
//
//  Created by Константин Канюка on 15.08.2022.
//

import UIKit

class ArrayCollectionViewCell: UICollectionViewCell {
    @IBOutlet var arrayCollectionCellLabel: UILabel!
    @IBOutlet var arrayCollectionViewCellIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        arrayCollectionCellLabel.isHidden = false
        arrayCollectionViewCellIndicator.stopAnimating()
        arrayCollectionViewCellIndicator.isHidden = true
    }
    
    func configure(withOperation operation: Operation) {
        switch operation.state {
        case .initial:
            arrayCollectionCellLabel.isHidden = false
            arrayCollectionViewCellIndicator.isHidden = true
            arrayCollectionCellLabel.text = operation.name
            arrayCollectionCellLabel.textColor = UIColor.systemBlue
        case .computing:
            arrayCollectionCellLabel.isHidden = true
            arrayCollectionViewCellIndicator.isHidden = false
            arrayCollectionViewCellIndicator.startAnimating()
        case .computed:
            arrayCollectionCellLabel.isHidden = false
            arrayCollectionViewCellIndicator.stopAnimating()
            arrayCollectionViewCellIndicator.isHidden = true
            arrayCollectionCellLabel.text = operation.name.trimmingCharacters(in: .punctuationCharacters) + " - " + (operation.output ?? "?")
            arrayCollectionCellLabel.textColor = UIColor.black
        }
    }
}
