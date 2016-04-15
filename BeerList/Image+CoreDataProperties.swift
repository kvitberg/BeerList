//
//  Image+CoreDataProperties.swift
//  BeerList
//
//  Created by Scott  on 15/04/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Image {

    @NSManaged var image: NSObject?
    @NSManaged var beer: NSSet?

}
