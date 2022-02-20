//
//  TableViewCell.swift
//  WeatherForecast
//
//  Created by Nuraly Amanayev on 2/21/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var JobLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "CustomCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "CustomCell", bundle: nil)
    }
    
}
