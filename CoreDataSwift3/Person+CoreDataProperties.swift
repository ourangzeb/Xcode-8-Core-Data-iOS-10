//
//  Person+CoreDataProperties.swift
//  CoreDataSwift3
//
//  Created by Ourangzaib khan on 10/24/16.
//  Copyright © 2016 Ourangzaib khan. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?
    @NSManaged public var phonenumber: Int

}
