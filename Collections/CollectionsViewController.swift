//
//  ViewController.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 08.08.2022.
//

import UIKit

final class CollectionsViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet private var mainTableView: UITableView! {
        didSet {
            mainTableView.alwaysBounceVertical = false
            mainTableView.delegate = self
            mainTableView.dataSource = self
            mainTableView.register(UINib(nibName: "FrontTableViewCell", bundle: nil),
            forCellReuseIdentifier: idCell)
        }
    }
    
    //MARK: - Properties
    
    private let idCell = "mainCell"
    private let colletionsCellsNames: [String] = ["Array", "Set", "Dictionaries"]
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colletionsCellsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? FrontTableViewCell else { return UITableViewCell() }
        cell.setUpLabelText(usersTypeText: colletionsCellsNames[indexPath.row])
        cell.selectionStyle = .none
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        switch indexPath.row {
        case 0:
            segueIdentifier = "goToArray"
        case 1:
            segueIdentifier = "goToSets"
        default:
            segueIdentifier = "goToDictionary"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}



