//
//  Todo.swift
//  TodoWithCoreData
//
//  Created by wannabewize on 2015. 3. 24..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import Foundation
import CoreData

@objc(Todo)
class Todo: NSManagedObject {

    @NSManaged var dueDate: NSDate
    @NSManaged var title: String

}
