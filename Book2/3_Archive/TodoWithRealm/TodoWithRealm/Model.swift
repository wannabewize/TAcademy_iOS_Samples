//
//  Model.swift
//  TodoWithRealm
//
//  Created by wannabewize on 2016. 3. 29..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import Foundation
import RealmSwift

class Todo : Object {
   dynamic var title = ""
   dynamic var dueDate : NSDate?
}
