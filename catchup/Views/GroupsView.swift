//
//  GroupsView.swift
//  catchup
//
//  Created by John Adams on 4/10/22.
//

import SwiftUI

struct GroupsView: View {
    
    
    //use this variable to access the ListViewModel.familyMembers list
    //you can create a GroupListView File (similar to the ListView) to make entried into the list. 
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        //view container for the two lists of people
        ScrollView{
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
                            //display first few members in list
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
                .onAppear(perform: listViewModel.getFamily)
            }
            //link to the listViewFriends view for friends
            /*
            NavigationLink(destination: ListViewFriends()) {
                ZStack{
                    Rectangle()
                        .frame(height: 300)
                        .cornerRadius(30)
                        .padding()
                        .foregroundColor(Color("skyBlue"))
                    VStack{
                        HStack{
                            Text("Friends")
                                .font(Font.custom("Arial Rounded MT Bold", size: 50))
                                .offset(x: 20)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        // show the first few friends
                        ForEach(listViewModel.friends.prefix(4)) {
                            person in
                            GroupsRowView(person: person)
                        }
                        Spacer()
                    }
                    .frame(height: 250)
                    .padding(.horizontal)

                    Spacer()
                }
                .onAppear(perform: listViewModel.getFriends)
            }
             */
        }
        .background(Color("skyBlue").opacity(0.4))
        
    }
}
//preview provider
struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GroupsView()
        }
        .environmentObject(ListViewModel())
    }
}
