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
    
    var notificationHandler: NotificationHandler = NotificationHandler()
    
    @Published var familyMembers: [personModel] = []
    @Published var friends: [personModel] = []
    
    init() {
        getFamily()
        getFriends()
    }
    
    func getFamily() {
        
        let newPeople = [
            personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(30), frequency: 3),
            personModel(name: "John A.", dateToContact: Date.now.addingTimeInterval(100), frequency: 10),
            personModel(name: "Add your family!", dateToContact: Date.now.addingTimeInterval(100), frequency: 14)
        ]
        familyMembers.append(contentsOf: newPeople)
    }
    
    func deletePerson(indexSet: IndexSet) {
        notificationHandler.activeNotifications.removeValue(forKey: familyMembers[indexSet.first!])
        familyMembers.remove(atOffsets: indexSet)
        
    }
    
    func movePerson(from: IndexSet, to: Int) {
        familyMembers.move(fromOffsets: from, toOffset: to)
    }
    
    func addPerson(name: String, date: Date, frequency: Int) {
        let newPerson = personModel(name: name, dateToContact: date, frequency: frequency)
        familyMembers.append(newPerson)
    }
    
    func addPerson(newPerson: personModel) {
        familyMembers.append(newPerson)
    }
    
    func getFriends() {
        
        let newPeople = [
            personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(30),  frequency: 3),
            personModel(name: "John A.", dateToContact: Date.now.addingTimeInterval(100), frequency: 10),
            personModel(name: "Add your friends!", dateToContact: Date.now.addingTimeInterval(100), frequency: 14)
        ]
        friends.append(contentsOf: newPeople)
    }
    
    func deleteFriend(indexSet: IndexSet) {
        friends.remove(atOffsets: indexSet)
        
    }
    
    func moveFriend(from: IndexSet, to: Int) {
        friends.move(fromOffsets: from, toOffset: to)
    }
    
    func addFriend(name: String, date: Date, frequency: Int) {
        let newPerson = personModel(name: name, dateToContact: date, frequency: frequency)
        friends.append(newPerson)
    }
    
    
}
