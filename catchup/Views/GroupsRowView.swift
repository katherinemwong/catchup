//
//  GroupsRowView.swift
//  catchup
//
//  Created by Kat Kat on 4/10/22.
//

import SwiftUI

struct GroupsRowView: View {
    let person: personModel
    //let name: String
    //let contactDate: Date?
    //checkDate(name, contactDate)
    
    var body: some View {
        ZStack{
            HStack {
                Text(person.name)
                    .padding(5)
            }
            .foregroundColor(Color.white)
            .cornerRadius(8)
        }
    }
}

struct GroupsRowView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsRowView(person: personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(600), frequency: 4))
            .previewLayout(.sizeThatFits)
    }
}
