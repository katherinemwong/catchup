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
    
    let familyMembersKey: String = "familyMembers_list"
    @Published var familyMembers: [personModel] = []
    
    let friendsKey: String = "friends_list"
    @Published var friends: [personModel] = []
    
    init() {
        getFamily()
        //getFriends()
    }
    
    func getFamily() {
        /*
        let newPeople = [
            personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(30), frequency: 3),
            personModel(name: "John A.", dateToContact: Date.now.addingTimeInterval(100), frequency: 10),
            personModel(name: "Add your family!", dateToContact: Date.now.addingTimeInterval(100), frequency: 14)
        ]
        familyMembers.append(contentsOf: newPeople)*/
        guard
            let data = UserDefaults.standard.data(forKey: familyMembersKey),
            let savedItems = try? JSONDecoder().decode([personModel].self, from: data)
        else {
            return }
        
        familyMembers = savedItems
    }
    
    func deletePerson(indexSet: IndexSet) {
        notificationHandler.activeNotifications.removeValue(forKey: familyMembers[indexSet.first!])
        familyMembers.remove(atOffsets: indexSet)
        saveItems()
    }
    
    func movePerson(from: IndexSet, to: Int) {
        familyMembers.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    
    func addPerson(name: String, date: Date, frequency: Int) {
        let newPerson = personModel(name: name, dateToContact: date, frequency: frequency)
        familyMembers.append(newPerson)
        saveItems()
    }
    
    func addPerson(newPerson: personModel) {
        familyMembers.append(newPerson)
        saveItems()
    }
    
    func getFriends() {
        /*
        let newPeople = [
            personModel(name: "Katherine W.", dateToContact: Date.now.addingTimeInterval(30),  frequency: 3),
            personModel(name: "John A.", dateToContact: Date.now.addingTimeInterval(100), frequency: 10),
            personModel(name: "Add your friends!", dateToContact: Date.now.addingTimeInterval(100), frequency: 14)
        ]
        friends.append(contentsOf: newPeople)
         */
        
        guard
            let data = UserDefaults.standard.data(forKey: friendsKey),
            let savedItems = try? JSONDecoder().decode([personModel].self, from: data)
        else { return }
        
        friends = savedItems
    }
    
    func deleteFriend(indexSet: IndexSet) {
        friends.remove(atOffsets: indexSet)
        saveItems()
    }
    
    func moveFriend(from: IndexSet, to: Int) {
        friends.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    
    func addFriend(name: String, date: Date, frequency: Int) {
        let newPerson = personModel(name: name, dateToContact: date, frequency: frequency)
        friends.append(newPerson)
        saveItems()
    }
    func addFriend(newPerson: personModel) {
        friends.append(newPerson)
        saveItems()
    }
    
    //converts list to .json
    func saveItems() {
        if let encodedFamilyData = try? JSONEncoder().encode(familyMembers) {
            UserDefaults.standard.set(encodedFamilyData, forKey: familyMembersKey)
        }
        if let encodedFriendData = try? JSONEncoder().encode(friends) {
            UserDefaults.standard.set(encodedFriendData, forKey: friendsKey)
        }
    }
}
