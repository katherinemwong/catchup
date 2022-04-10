//
//  personModel.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import Foundation

struct personModel: Identifiable {
    let name: String
    var dateContacted: Date?
    var frequency: Int
    var id: String = UUID().uuidString
}
