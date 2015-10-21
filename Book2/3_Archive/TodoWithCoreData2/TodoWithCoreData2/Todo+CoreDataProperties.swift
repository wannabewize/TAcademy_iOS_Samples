//
//  Todo+CoreDataProperties.swift
//  TodoWithCoreData2
//
//  Created by wannabewize on 10/22/15.
//  Copyright © 2015 wannabewize. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var dueDate: NSDate?
    @NSManaged var title: String?
    @NSManaged var group: Group?

}
