//
//  BeerDetailsViewController.swift
//  BeerList
//
//  Created by Scott Kvitberg on 20/12/2016.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import UIKit
import CoreData

class BeerDetailsViewController: UIViewController {
    
    @IBOutlet weak var beerBrandTextField: CustomTextField!
    @IBOutlet weak var beerTypeTextField: CustomTextField!
    @IBOutlet weak var beerCountryTextField: CustomTextField!
    
    // TODO: add list to auto complete for contries
    // TODO: add list to auto complete for beer companies
    // TODO: add list to auto complete for beer types
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addBeerButtonPressedAction(_ sender: UIButton) {
        let beer = NSEntityDescription.insertNewObject(forEntityName: "Beer", into: appDelegate.managedObjectContext) as! Beer
        if let brand = beerBrandTextField.text{
            beer.brand = brand
        }
        if let name = beerTypeTextField.text {
            beer.name = name
        }
        if let country = beerCountryTextField.text {
            beer.country = country
        }
        
        appDelegate.saveContext()
        self.navigationController?.popViewController(animated: true)
        
        
        
    }

}
