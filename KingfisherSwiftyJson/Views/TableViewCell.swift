//
//  TableViewCell.swift
//  KingfisherSwiftyJson
//
//  Created by Henry Aguinaga on 2019-04-02.
//  Copyright © 2019 Henry Aguinaga. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblTrack: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
