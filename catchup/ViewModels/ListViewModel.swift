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
    @Published var familyMembers: [PersonModel] = []
    
    //when initialized pull data from storage to rebuild the list
    init() {
        readStorage()
    }
    
    //attempts to retrieve list from user preferences data
    func readStorage() {
        guard
            let data = UserDefaults.standard.data(forKey: familyMembersKey),
            let savedItems = try? JSONDecoder().decode([PersonModel].self, from: data)
        else {
            return }
    
        familyMembers = savedItems
    }
    
    //remove a person from the list
    func deletePerson(indexSet: IndexSet) {
        notificationHandler.activeNotifications.removeValue(forKey: familyMembers[indexSet.first!])
        familyMembers.remove(atOffsets: indexSet)
        saveItems()
    }
    
    //relocate person in the list (based on the offset provided by the built in list editor, see ListView)
    func movePerson(from: IndexSet, to: Int) {
        familyMembers.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    
    func addPerson(name: String, date: Date, frequency: Int) {
        let newPerson = PersonModel(name: name, dateToContact: date, frequency: frequency)
        familyMembers.append(newPerson)
        saveItems()
    }
    
    func addPerson(newPerson: PersonModel) {
        familyMembers.append(newPerson)
        saveItems()
    }
    
    //converts list to .json
    func saveItems() {
        if let encodedFamilyData = try? JSONEncoder().encode(familyMembers) {
            UserDefaults.standard.set(encodedFamilyData, forKey: familyMembersKey)
        }
    }
}
