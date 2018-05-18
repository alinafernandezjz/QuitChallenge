//
//  ComunidadTableViewCell.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 30/04/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class ComunidadTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var usuario: UILabel!
    
    fileprivate
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
