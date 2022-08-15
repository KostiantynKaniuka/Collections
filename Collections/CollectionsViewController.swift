//
//  ViewController.swift
//  Collections
//
//  Created by Константин Канюка on 08.08.2022.
//

import UIKit

class CollectionsViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    let idCell = "mailCell"
    var frontText: [String] = ["Array","Set","Dictionaries"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
    }
    
}

extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frontText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! MainTableViewCell
        cell.cellLabel.text = frontText[indexPath.row]
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
            segueIdentifier = "showView2"
        default:
            segueIdentifier = "showView3"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}



