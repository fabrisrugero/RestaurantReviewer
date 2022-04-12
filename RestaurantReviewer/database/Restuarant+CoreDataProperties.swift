//
//  Restuarant+CoreDataProperties.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-04-12.
//
//

import Foundation
import CoreData


extension Restuarant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restuarant> {
        return NSFetchRequest<Restuarant>(entityName: "Restuarant")
    }

    @NSManaged public var tags: String?
    @NSManaged public var address: String?
    @NSManaged public var url: String?
    @NSManaged public var review: Int16
    @NSManaged public var name: String?
    @NSManaged public var hours: String?
    @NSManaged public var contact: String?
    @NSManaged public var price: String?
    @NSManaged public var info: String?

}

extension Restuarant : Identifiable {

}
