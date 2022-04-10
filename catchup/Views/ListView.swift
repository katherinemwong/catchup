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
        .navigationTitle("catch-up with Family")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


