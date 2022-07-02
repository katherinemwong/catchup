//
//  personModel.swift
//  catchup
//
//  John & Katherine
//

import Foundation

struct personModel: Identifiable, Hashable, Codable {
    let name: String                        //the name of the person
    let dateToContact: Date                 //next time to contact the person
    let frequency: Int                      //how often to contact the person
    var id: String = UUID().uuidString      //a unique identifier for the person
    let parentList: String                  //the list that this person belongs in
}
