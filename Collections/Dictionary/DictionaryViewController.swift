//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 18.08.2022.
//

import UIKit

final class DictionaryViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet private var dictionaryLabel: UILabel! {
        didSet {
            dictionaryLabel.isHidden = true
        }
    }
    
    @IBOutlet private var arrayLabel: UILabel! {
        didSet {
            arrayLabel.isHidden = true
        }
    }
    
    @IBOutlet private var dictionaryCollectionView: UICollectionView! {
        didSet {
            dictionaryCollectionView.delegate = self
            dictionaryCollectionView.dataSource = self
            dictionaryCollectionView.isHidden = true
        }
    }
    
    @IBOutlet private var mediumActivityIndicator: UIActivityIndicatorView! {
        didSet {
            mediumActivityIndicator.startAnimating()
        }
    }
    
    //MARK: - Properties
    
    private let dictionaryOperations = DictionaryCellActionLogic()
    private let dictionaryCellIdentifier = "dictionaryOptionCell"
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryOperations.createArray()
        dictionaryOperations.createDictionary(completion: { [weak self] output in
            self?.configureWhenCreated()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: - Method
    
   private func configureWhenCreated() {
       mediumActivityIndicator.stopAnimating()
       mediumActivityIndicator.isHidden = true
        arrayLabel.isHidden = false
        dictionaryLabel.isHidden = false
        dictionaryCollectionView.isHidden = false
    }
}

//MARK: - CollectionViewDatasource

extension DictionaryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictionaryOperations.operationsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dictionaryCellIdentifier, for: indexPath) as? DictionaryCollectionViewCell else { return UICollectionViewCell() }
        let operation = dictionaryOperations.operationAtIndex(indexPath.row)
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.configure(withOperation: operation)
        return cell
    }
}

//MARK: - CollectionViewDelegate

extension DictionaryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let operation = dictionaryOperations.operationAtIndex(indexPath.row)
        return  dictionaryOperations.cellPressed(fillingInstance: operation, beginingOfCarculation: { self.dictionaryCollectionView.reloadData() }, completion: { self.dictionaryCollectionView.reloadData() })
    }
}

//MARK: - CollectionViewFlowLayuot

extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 100)
    }
}

