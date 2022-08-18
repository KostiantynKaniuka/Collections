//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Константин Канюка on 18.08.2022.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet var dictionaryLabel: UILabel!
    @IBOutlet var arrayLabel: UILabel!
    @IBOutlet var dictionaryCollectionView: UICollectionView!
    @IBOutlet var mediumActivityIndicator: UIActivityIndicatorView!
    let dictionaryOperations = DictionaryOperations()
    let dictionaryCellIdentifier = "dictionaryOptionCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayLabel.isHidden = true
        dictionaryLabel.isHidden = true
        dictionaryCollectionView.delegate = self
        dictionaryCollectionView.dataSource = self
        dictionaryCollectionView.isHidden = true
       mediumActivityIndicator.startAnimating()
        dictionaryOperations.createArray()
        dictionaryOperations.createDictionary(completion: { [weak self] output in
            self?.configureWhenCreated()
        } )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    func configureWhenCreated() {
       mediumActivityIndicator.stopAnimating()
       mediumActivityIndicator.isHidden = true
        arrayLabel.isHidden = false
        dictionaryLabel.isHidden = false
        dictionaryCollectionView.isHidden = false
    }
}

extension DictionaryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dictionaryOperations.operationsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dictionaryCellIdentifier, for: indexPath) as! DictionaryCollectionViewCell
        let operation = dictionaryOperations.operationAtIndex(indexPath.row)
        cell.backgroundColor = UIColor.lightGray
        cell.configure(withOperation: operation)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let operation = dictionaryOperations.operationAtIndex(indexPath.row)
        dictionaryOperations.perform(operation: operation, launchedComputing: { self.dictionaryCollectionView.reloadData() }, completion: { self.dictionaryCollectionView.reloadData() })
    }
     
}
