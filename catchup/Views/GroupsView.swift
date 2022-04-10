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
        ScrollView{
            ZStack{
                Rectangle()
                    .frame(height: 300)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(Color("darkBlue"))
                VStack{
                    HStack{
                        Text("Family")
                            .font(Font.custom("Arial Rounded MT Bold", size: 50))
                            .offset(x: 20)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .frame(height: 300)
                Spacer()
            }
            
            ZStack{
                Rectangle()
                    .frame(height: 300)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(Color("darkBlue"))
                VStack{
                    HStack{
                        Text("Friends")
                            .font(Font.custom("Arial Rounded MT Bold", size: 50))
                            .offset(x: 20)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .frame(height: 300)
                Spacer()
            }
        }
        .background(Color("skyBlue").opacity(0.4))
        
    }
}

struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GroupsView()
        }
        .environmentObject(ListViewModel())
    }
}
