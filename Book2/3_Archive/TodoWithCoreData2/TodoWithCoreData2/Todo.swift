//
//  Todo.swift
//  TodoWithCoreData2
//
//  Created by wannabewize on 2015. 3. 25..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import Foundation
import CoreData

@objc(Todo)
class Todo: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var dueDate: NSDate
    @NSManaged var group: Group

}
