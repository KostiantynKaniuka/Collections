//
//  TitleTableViewCell.swift
//  Collections
//
//  Created by Константин Канюка on 08.09.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    
func setUpLabelText(usersTypeText: String) {
    cellLabel.text = usersTypeText
}


    
}
