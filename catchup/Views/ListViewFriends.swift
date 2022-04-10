//
//  ListViewFriends.swift
//  catchup
//
//  Created by John Adams on 4/10/22.
//

import SwiftUI

/*
 View for the list of people in whole
 */
struct ListViewFriends: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        
        List {
            //generate a new entry into the list for each person
            ForEach(listViewModel.familyMembers) {person in
                ListRowView(person: person)
            }
            .onDelete(perform: listViewModel.deletePerson)
            .onMove(perform: listViewModel.movePerson)
            //ListRowView(name: "katherchin")
        }
            .listStyle(PlainListStyle())
            .navigationTitle("catch-up with")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add", destination: AddViewFriends())
            )
    }
}


struct ListViewFriends_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListViewFriends()
        }
        .environmentObject(ListViewModel())
    }
}
