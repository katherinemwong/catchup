//
//  listModel.swift
//  catchup
//
//  Created by John Adams on 7/2/22.
//

import Foundation

struct listModel: Identifiable, Hashable, Codable {
    let name: String                        //the name of the list
    var id: String = UUID().uuidString      //a unique identifier for the list
}
