//
//  MyCellTableViewCell.swift
//  Collections
//
//  Created by Константин Канюка on 09.08.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
