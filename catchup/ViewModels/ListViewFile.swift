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
    @Published var friends: [personModel] = []
    
    init() {
        getFamily()
        getFriends()
    }
    
    func getFamily() {
        
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
    
    func addPerson(name: String, frequency: Int) {
        let newPerson = personModel(name: name, frequency: frequency)
        familyMembers.append(newPerson)
    }
    
    func getFriends() {
        
        let newPeople = [
            personModel(name: "Friend 1", frequency: 3),
            personModel(name: "Friend 2", frequency: 10),
            personModel(name: "Friend 3", frequency: 14)
        ]
        friends.append(contentsOf: newPeople)
    }
    
    func deleteFriend(indexSet: IndexSet) {
        friends.remove(atOffsets: indexSet)
        
    }
    
    func moveFriend(from: IndexSet, to: Int) {
        friends.move(fromOffsets: from, toOffset: to)
    }
    
    func addFriend(name: String, frequency: Int) {
        let newPerson = personModel(name: name, frequency: frequency)
        friends.append(newPerson)
    }
    
    
}
