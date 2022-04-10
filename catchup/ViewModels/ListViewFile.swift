//
//  SwiftUIView.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//
import Foundation
/*
 Class for storing the array of people in the list
 */
class ListViewModel: ObservableObject {
    
    @Published var familyMembers: [personModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        let newPeople = [
            personModel(name: "Katherine W.", frequency: 3),
            personModel(name: "John A.", frequency: 10),
            personModel(name: "Jackson F.", frequency: 14)
        ]
        familyMembers.append(contentsOf: newPeople)
    }
    
    func deletePerson(indexSet: IndexSet) {
        familyMembers.remove(atOffsets: indexSet)
    }
    
    func movePerson(from: IndexSet, to: Int) {
        familyMembers.move(fromOffsets: from, toOffset: to)
    }
}
