//
//  groupModel.swift
//  catchup
//
//  Created by John Adams on 7/2/22.
//

/*
 Basic data structure for a group of people
 Stores a the name of the group, and unique identifier, and a list of people
 */
import Foundation

struct GroupModel: Identifiable, Hashable, Codable {
    var name: String                        //the name of the list
    var id: String = UUID().uuidString      //a unique identifier for the list
    var Members: [PersonModel] = []         //list of people in the list
    var version: String = "1.0"             //track version of data for upgrade purposes
}
