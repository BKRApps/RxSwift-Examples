//
//  SimpleCell.swift
//  RxSwift-Example
//
//  Created by Birapuram Kumar Reddy on 12/22/17.
//  Copyright © 2017 KRiOSApps. All rights reserved.
//

import UIKit

class SimpleCell: UITableViewCell {


    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(title:String,desc:String){
        self.title.text = title
        self.desc.text = desc
    }

}
