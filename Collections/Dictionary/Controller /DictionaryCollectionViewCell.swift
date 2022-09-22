//
//  CollectionViewCell.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 18.08.2022.
//

import UIKit

final class DictionaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var dictionaryCellLabel: UILabel!
    @IBOutlet var dictionaryActivityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setUp()
    }
    
    func borderConfigure() {
        backgroundColor = UIColor.lightGray
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.5
    }
    
    func configure(withOperation operation: CellsFilling) {
        switch operation.state {
        case .initiated:
            dictionaryCellLabel.isHidden = false
            dictionaryActivityIndicator.isHidden = true
            dictionaryCellLabel.text = operation.name
            dictionaryCellLabel.textColor = UIColor.systemBlue
        case .computing:
            dictionaryCellLabel.isHidden = true
            dictionaryActivityIndicator.isHidden = false
            dictionaryActivityIndicator.startAnimating()
        case .completed:
            dictionaryCellLabel.isHidden = false
            dictionaryActivityIndicator.stopAnimating()
            dictionaryActivityIndicator.isHidden = true
            dictionaryCellLabel.text = operation.name + " " + (operation.output ?? "?")
            dictionaryCellLabel.textColor = UIColor.black
        }
    }
    
    private func setUp() {
        dictionaryCellLabel.isHidden = false
        dictionaryActivityIndicator.stopAnimating()
        dictionaryActivityIndicator.isHidden = true
    }
}
