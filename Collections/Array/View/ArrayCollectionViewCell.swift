//
//  ArrayCollectionViewCell.swift
//  Collections
//
//  Created by Константин Канюка on 15.08.2022.
//

import UIKit

class ArrayCollectionViewCell: UICollectionViewCell {
    @IBOutlet var CellLabel: UILabel!
    @IBOutlet var CellActivityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
       setUp()
    }
        
    func configure(withOperation operation: CellsFilling) {
        switch operation.state {
        case .initiated:
            CellLabel.isHidden = false
            CellActivityIndicator.isHidden = true
            CellLabel.text = operation.name
            CellLabel.textColor = UIColor.systemBlue
        case .computing:
            CellLabel.isHidden = true
            CellActivityIndicator.isHidden = false
            CellActivityIndicator.startAnimating()
        case .completed:
            CellLabel.isHidden = false
            CellActivityIndicator.stopAnimating()
            CellActivityIndicator.isHidden = true
            CellLabel.text = operation.name.trimmingCharacters(in: .punctuationCharacters) + " - " + (operation.output ?? "?")
            CellLabel.textColor = UIColor.black
        }
    }
    
    private func setUp() {
        CellLabel.isHidden = false
        CellActivityIndicator.stopAnimating()
        CellActivityIndicator.isHidden = true
    }
}
