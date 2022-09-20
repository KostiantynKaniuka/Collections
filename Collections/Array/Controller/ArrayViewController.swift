//
//  ArrayViewController.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
//

import UIKit

class ArrayViewController: UIViewController {
    //MARK: - Properties
    private let arrayOperations = ArrayCellCreationLogic()
    private let cellIdentifier = "optionCell"
    
    //MARK: - Outlets
    
    @IBOutlet private var executionTimeLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var arrayCreationButton: UIButton!
    @IBOutlet private var CollectionView: UICollectionView! {
        didSet {
            CollectionView.dataSource = self
            CollectionView.delegate = self
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    //MARK: - Actions
    
    @IBAction func arrayCreationButtonTapped(_ sender: Any) {
        arrayCreationButton.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        arrayOperations.create(completion: { [weak self] output in
            self?.actionsAfterArrayCreated(withOutput: output)
        } )
    }
    
    //MARK: - Method
    
    private func actionsAfterArrayCreated(withOutput output: String?) -> Void {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        executionTimeLabel.isHidden = false
        executionTimeLabel.text = "Array creation " + (output ?? "")
        CollectionView.isHidden = false
    }
    
    private func setUp() {
        arrayCreationButton.isHidden = false
        activityIndicator.isHidden = true
        executionTimeLabel.isHidden = true
        CollectionView.isHidden = true
        arrayCreationButton.titleLabel?.adjustsFontSizeToFitWidth = true
        arrayCreationButton.titleLabel?.minimumScaleFactor = 0.5
        executionTimeLabel.adjustsFontSizeToFitWidth = true
        executionTimeLabel.minimumScaleFactor = 0.5
    }
}

//MARK: - CollectionView DataSource

extension ArrayViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOperations.operationsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ArrayCollectionViewCell else { return UICollectionViewCell() }
        guard let operation = arrayOperations.operationAtIndex(indexPath.row) else { return collectionView.dequeueReusableCell(withReuseIdentifier: "optionCell", for: indexPath)}
        cell.backgroundColor = UIColor.lightGray
        cell.configure(withOperation: operation)
        return cell
    }
}

//MARK: - CollectionView Delegate

extension ArrayViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let operation = arrayOperations.operationAtIndex(indexPath.row) else { return }
        arrayOperations.cellPressed(fillingInstance: operation, beginingOfCarculation: {[weak self] in self?.CollectionView.reloadData()}
                                    , completion: {self.CollectionView.reloadData()})
    }
}
