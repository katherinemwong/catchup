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
            //generate a new row entry into the list for each GROUP
            ForEach(groupViewModel.contactGroups) {group in
                // TO-DO: i think we should make a person class bc when u add contacts, they are all added to ListView. So make objects using class and store in an array
                NavigationLink(destination: ListView()) {
                    GroupsRowView(group: group)
                }
            }
            //parameters of the List to delete/rearrange GROUPS
            .onDelete(perform: groupViewModel.deleteGroup)
            .onMove(perform: groupViewModel.moveGroup)
        }
        //parameters of the body View
        .listStyle(PlainListStyle())
        .navigationTitle("contact groups")
        .navigationBarItems(trailing: NavigationLink("Add", destination: AddGroupView()))
        .background(Color.white)
        
    }
}
//preview provider
struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            GroupsView()
        }
        .environmentObject(ListViewModel())
        .environmentObject(GroupViewModel())
    }
}
