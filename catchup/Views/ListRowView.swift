//
//  ListRowView.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import SwiftUI

let formatter = DateFormatter()

/*
 View for a single person in the list of people
 */
struct ListRowView: View {
    
    let person: personModel
    //let name: String
    //let contactDate: Date?
    //checkDate(name, contactDate)
    
    var body: some View {
        ZStack{
            HStack {
                Text(person.name)
                Spacer()
                Text("contact every \(person.frequency) days")
            }
            .foregroundColor(Color("darkBlue"))
            .cornerRadius(8)
        }
    }
}

// some NON FUNCTIONAL code for dates, will work on it more in future
/*
func checkDate(name: String, contactDate: Date?) {
    var contactText: String
    
    if contactDate == nil {
        contactText = "never contacted"
    } else {
        contactText = "last contacted \(contactDate)"
    }
}
*/
// This generates the preview window
struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(person: personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(800), frequency: 4))
            .previewLayout(.sizeThatFits)
    }
        
}
