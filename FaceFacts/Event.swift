//
//  Event.swift
//  FaceFacts
//
//  Created by Cường Nguyễn Bá on 29/10/25.
//

import Foundation
import SwiftData

@Model
class Event {
    var name: String
    var location: String
    var people = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
