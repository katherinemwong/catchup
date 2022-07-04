//
//  personModel.swift
//  catchup
//
//  John & Katherine
//

import Foundation

/*
 Basic data structure for a person-type object
 */
struct PersonModel: Identifiable, Hashable, Codable {
    let name: String                        //the name of the person
    let dateToContact: Date                 //next time to contact the person
    let frequency: Int                      //how often to contact the person
    var id: String = UUID().uuidString      //a unique identifier for the person
    var version: String = "1.0"             //track version of data for upgrade purposes
}
