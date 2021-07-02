//
//  CustomViewCell.swift
//  WeatherApp
//
//  Created by veerut hengnopparatkul on 2/7/2564 BE.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    @IBOutlet weak var day: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
