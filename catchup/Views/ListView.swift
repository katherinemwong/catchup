//
//  ListView.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import SwiftUI

/*
 View for the list of people in whole
 */
struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    //@EnvironmentObject var groupViewModel: GroupViewModel
    //@State var groups: [GroupModel]
    
    var body: some View {
        
        List {
            //generate a new row entry into the list for each person
            ForEach(listViewModel.familyMembers) {person in
                ListRowView(person: person)
            }
            //parameters of the List to delete/rearrange people
            .onDelete(perform: listViewModel.deletePerson)
            .onMove(perform: listViewModel.movePerson)
        }
        //parameters of the body View
        .listStyle(PlainListStyle())
        .navigationTitle("catch-up with")
        .navigationBarItems(trailing: NavigationLink("Add", destination: AddView()))
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
        //.environmentObject(GroupViewModel())
    }
}
