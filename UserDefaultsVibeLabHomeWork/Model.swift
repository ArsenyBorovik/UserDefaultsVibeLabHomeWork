//
//  Model.swift
//  UserDefaultsVibeLabHomeWork
//
//  Created by Арсений on 12/27/23.
//

import Foundation

struct Color: Codable {
    var redValue = drand48()
    var greenValue = drand48()
    var blueValue = drand48()
    var alpha = 1.0
}
