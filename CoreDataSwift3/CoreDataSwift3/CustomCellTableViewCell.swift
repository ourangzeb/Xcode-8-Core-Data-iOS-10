//
//  CustomCellTableViewCell.swift
//  CoreDataSwift3
//
//  Created by Ourangzaib khan on 10/24/16.
//  Copyright © 2016 Ourangzaib khan. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phonenumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
