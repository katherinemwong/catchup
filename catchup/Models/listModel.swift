//
//  listModel.swift
//  catchup
//
//  Created by John Adams on 7/2/22.
//

/*
 Object that is the lists to be shown in the app
 */
import Foundation

struct listModel: Identifiable, Hashable, Codable {
    let name: String                        //the name of the list
    var id: String = UUID().uuidString      //a unique identifier for the list
    var Members: [personModel] = []         //list of people in the list
}
