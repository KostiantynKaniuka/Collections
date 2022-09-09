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
    private let colletionsCellsNames: [String] = ["Array", "Set", "Dictionary"]
  
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
        var segueIdentifier: String = ""
            if indexPath.row == 0 {
                segueType = .array
                segueIdentifier = getSegue()
            } else if indexPath.row == 1 {
                segueType = .set
                segueIdentifier = getSegue()
            } else if indexPath.row == 2 {
                segueType = .dictionary
                segueIdentifier = getSegue()
            }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}
 
//MARK: - SegueSettings

enum CollectionSegue {
    case array
    case set
    case dictionary
}

private var segueType: CollectionSegue = .set

private func getSegue() -> String {
    switch segueType {
    case .array:
       return "goToArray"
    case .set:
        return "goToSets"
    case .dictionary:
        return "goToDictionary"
    }
}

