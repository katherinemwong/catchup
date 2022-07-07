//
//  GroupsRowView.swift
//  catchup
//
//  Created by Kat Kat on 4/10/22.
//

import SwiftUI

/*
 view for each of the individual members shows in the GroupsView
 
 only up to the first 3 members in the list are shown.
 */
struct GroupsRowView: View {
    //let person: PersonModel
    //let name: String
    //let contactDate: Date?
    //checkDate(name, contactDate)
    let group: GroupModel
    var body: some View {
        ZStack{
            HStack {
                Text(group.name)
                    .padding(5)
            }
            .foregroundColor(Color.white)
            .cornerRadius(8)
        }
    }
}

struct GroupsRowView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsRowView(group: GroupModel(name: "Friends"))
            .previewLayout(.sizeThatFits)
            .background(Color("skyBlue").opacity(0.4))
    }
}
