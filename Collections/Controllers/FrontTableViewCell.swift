//
//  FrontTableViewCell.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 08.09.2022.
//

import UIKit

final class FrontTableViewCell: UITableViewCell {
    @IBOutlet private var cellLabel: UILabel!
    
    func setUpLabelText(usersTypeText: String) {
        cellLabel.text = usersTypeText
    }
}
