//
//  RecipeActivityCell.swift
//  AutoLayout
//
//  Created by Ramesh on 16/02/17.
//  Copyright © 2017 Ramesh. All rights reserved.
//

import UIKit

class RecipeActivityCell: UITableViewCell {

    @IBOutlet weak var imgRecipeImage: UIImageView!
    @IBOutlet weak var imgUserProfilePic: UIImageView!
    @IBOutlet weak var lblActivityText: UILabel!
    @IBOutlet weak var lblTimeText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
