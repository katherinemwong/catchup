//
//  ListRowView.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import SwiftUI

let formatter = DateFormatter()

/*
 View for a single person in the list of people, each person gets a seperate line, which are all stacked toegther.
 */
struct ListRowView: View {
    
    //this variable is instantiated with a person when the ListRowView is created
    let person: personModel
    
    var body: some View {
        ZStack{
            HStack {
                //display person's name and how often they are contacted
                Text(person.name)
                Spacer()
                Text("contact every \(person.frequency) days")
            }
            .foregroundColor(Color("darkBlue"))
            .cornerRadius(8)
        }
    }
}

// This generates the preview window
struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(person: personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(800), frequency: 4))
            .previewLayout(.sizeThatFits)
    }
        
}
