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
        }
        .background(Color("skyBlue").opacity(0.4))
        
    }
}
//preview provider
struct GroupsListView_Previews: PreviewProvider {
    var previewPerson = personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(600), frequency: 4)
    
    static var previews: some View {
        NavigationView{
            GroupsView()
        }
        .environmentObject(ListViewModel())
    }
}
