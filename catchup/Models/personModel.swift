//
//  personModel.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import Foundation

struct personModel: Identifiable, Hashable, Codable {
    let name: String
    let dateToContact: Date
    let frequency: Int
    var id: String = UUID().uuidString
}
