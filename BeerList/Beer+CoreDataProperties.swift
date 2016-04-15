//
//  Beer+CoreDataProperties.swift
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

extension Beer {

    @NSManaged var name: String?
    @NSManaged var details: String?
    @NSManaged var country: String?
    @NSManaged var type: String?
    @NSManaged var brand: String?
    @NSManaged var flag_code: String?
    @NSManaged var image: Image?
    @NSManaged var itemType: ImageType?

}
