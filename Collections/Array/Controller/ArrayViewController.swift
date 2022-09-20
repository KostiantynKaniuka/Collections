//
//  ArrayViewController.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
//

import UIKit

class ArrayViewController: UIViewController {
    @IBOutlet var executionTimeLabel: UILabel!
    @IBOutlet var arrayActivityIndicator: UIActivityIndicatorView!
    @IBOutlet var arrayCreationButton: UIButton!
    @IBOutlet var arrayCollectionView: UICollectionView!
    
    private let arrayOperations = ArrayCellCreationLogic()
    private let cellIdentifier = "optionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCollectionView.dataSource = self
        arrayCollectionView.delegate = self
        arrayCreationButton.isHidden = false
        arrayActivityIndicator.isHidden = true
        executionTimeLabel.isHidden = true
        arrayCollectionView.isHidden = true
        arrayCreationButton.titleLabel?.adjustsFontSizeToFitWidth = true
        arrayCreationButton.titleLabel?.minimumScaleFactor = 0.5
        executionTimeLabel.adjustsFontSizeToFitWidth = true
        executionTimeLabel.minimumScaleFactor = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func configureWhenArrayCreated(withOutput output: String?) -> Void {
        self.arrayActivityIndicator.stopAnimating()
        self.arrayActivityIndicator.isHidden = true
        self.executionTimeLabel.isHidden = false
        self.executionTimeLabel.text = "Array creation " + (output ?? "")
        self.arrayCollectionView.isHidden = false
    }
    
    @IBAction func arrayCreationButtonTapped(_ sender: Any) {
        self.arrayCreationButton.isHidden = true
        self.arrayActivityIndicator.isHidden = false
        self.arrayActivityIndicator.startAnimating()
        arrayOperations.create(completion: { [weak self] output in
            self?.configureWhenArrayCreated(withOutput: output)
        } )
    }
}

extension ArrayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOperations.operationsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ArrayCollectionViewCell
        let operation = arrayOperations.operationAtIndex(indexPath.row)
        cell.backgroundColor = UIColor.lightGray
        cell.configure(withOperation: operation)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let operation = arrayOperations.operationAtIndex(indexPath.row)
        arrayOperations.cellPressed(fillingInstance: operation, beginingOfCarculation:   {self.arrayCollectionView.reloadData()}
                                    , completion:  {self.arrayCollectionView.reloadData()})
    }
}

