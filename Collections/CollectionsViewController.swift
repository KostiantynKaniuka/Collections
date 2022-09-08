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
            mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil),
            forCellReuseIdentifier: idCell)
        }
    }
    
    //MARK: - Properties
    
    private let idCell = "mailCell"
    private let colletionsNames: [String] = ["Array", "Set", "Dictionaries"]
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colletionsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? FrontTableViewCell else { return UITableViewCell() }
        cell.setUpLabelText(usersTypeText: colletionsNames[indexPath.row])
        return cell 
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Collections"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = .black
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            header.sizeToFit()
        }
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



