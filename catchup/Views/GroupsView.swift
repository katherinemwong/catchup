//
//  GroupsView.swift
//  catchup
//
//  Created by John Adams on 4/10/22.
//

import SwiftUI

/*
 View of the different lists of people
 */
struct GroupsView: View {
    
    
    @EnvironmentObject var listViewModel: ListViewModel
    @EnvironmentObject var groupViewModel: GroupViewModel
    
    var body: some View {
        //view container for the two lists of people
        /*ScrollView{
            //link to the listView view for family
            NavigationLink(destination: ListView()) {
                ZStack{
                    
                    Rectangle()
                        .frame(height: 300)
                        .cornerRadius(30)
                        .padding()
                        .foregroundColor(Color("skyBlue"))
                    VStack{
                        
                        HStack{
                            Text("Family")
                                .font(Font.custom("Arial Rounded MT Bold", size: 50))
                                .offset(x: 20)
                                .foregroundColor(.white)
                        
                            Spacer()
                        }
                            //display first 4 members in list
                            //calls GroupsRowView() up to 4 times
                            ForEach(listViewModel.familyMembers.prefix(4)) {
                                person in
                                GroupsRowView(person: person)
                            }
                        
                        Spacer()
                    }
                    .frame(height: 250)
                    .padding(.horizontal)
                    Spacer()
                }
                //when this block is shown, create the list of people from storage
                .onAppear(perform: listViewModel.readStorage)
            }
        }*/
        List{
            //generate a new row entry into the list for each person
            ForEach(groupViewModel.contactGroups) {group in
                GroupsRowView(group: group)
            }
            //parameters of the List to delete/rearrange people
            .onDelete(perform: groupViewModel.deleteGroup)
            .onMove(perform: groupViewModel.moveGroup)
        }
        //parameters of the body View
        .listStyle(PlainListStyle())
        .navigationTitle("contact groups")
        .navigationBarItems(trailing: NavigationLink("Add", destination: AddView()))
        .background(Color("skyBlue").opacity(0.4))
        
    }
}
//preview provider
struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let person1 = PersonModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(600), frequency: 4)
        let person2 = PersonModel(name: "John A.", dateToContact: Date.now.addingTimeInterval(600), frequency: 2)
        let person3 = PersonModel(name: "UCSD", dateToContact: Date.now.addingTimeInterval(600), frequency: 10)
        
        //var group1 = GroupModel(name: "LosersClub", members: [person1, person2, person3])
        
        //GroupsView(group1) should produce a valid preview with members if code is built well.
        
        NavigationView{
            GroupsView()
        }
        //.environmentObject(ListViewModel())
        .environmentObject(GroupViewModel())
    }
}
