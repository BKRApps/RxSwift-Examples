//
//  CityCell.swift
//  RxSwift-Example
//
//  Created by Birapuram Kumar Reddy on 12/22/17.
//  Copyright © 2017 KRiOSApps. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(cityName:String){
        self.cityName.text = cityName
    }

}
