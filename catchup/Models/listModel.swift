//
//  listModel.swift
//  catchup
//
//  Created by John Adams on 7/2/22.
//

/*
 Basic data structure for a list-type object
    stores a list of people
 */
import Foundation

struct listModel: Identifiable, Hashable, Codable {
    let name: String                        //the name of the list
    var id: String = UUID().uuidString      //a unique identifier for the list
    var Members: [personModel] = []         //list of people in the list
}
