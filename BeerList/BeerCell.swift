//
//  BeerCell.swift
//  BeerList
//
//  Created by Scott  on 15/04/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell {
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var beerBrand: UILabel!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var country: UILabel!

    func configuereCell(beer: Beer){
        beerName.text = beer.name
        beerBrand.text = beer.brand
        country.text = beer.country
    
    }
}
