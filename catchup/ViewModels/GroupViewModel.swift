//
//  GroupViewModel.swift
//  catchup
//
//  Created by Kat Kat on 7/7/22.
//

import Foundation

/*
 Class for storing the groups in the list
 */
class GroupViewModel: ObservableObject {
    
    //var notificationHandler: NotificationHandler = NotificationHandler()
    
    let groupKey: String = "group_list"
    //@Published var familyMembers: [PersonModel] = []
    @Published var contactGroups: [GroupModel] = []
    
    //when initialized pull data from storage to rebuild the list
    init() {
        readStorage()
    }
    
    //attempts to retrieve list from user preferences data
    func readStorage() {
        guard
            let data = UserDefaults.standard.data(forKey: groupKey),
            let savedItems = try? JSONDecoder().decode([GroupModel].self, from: data)
        else {
            return }
    
        contactGroups = savedItems
    }
    
    //remove a person from the list
    func deleteGroup(indexSet: IndexSet) {
        //notificationHandler.activeNotifications.removeValue(forKey: familyMembers[indexSet.first!])
        contactGroups.remove(atOffsets: indexSet)
        saveItems()
    }
    
    //relocate person in the list (based on the offset provided by the built in list editor, see ListView)
    func moveGroup(from: IndexSet, to: Int) {
        contactGroups.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    
    func addGroup(name: String) {
        let group = GroupModel(name: name)
        contactGroups.append(group)
        saveItems()
    }
    
    //func addPerson(newPerson: PersonModel) {
    //    familyMembers.append(newPerson)
    //    saveItems()
    //}
    
    //converts list to .json
    func saveItems() {
        if let encodedGroupData = try? JSONEncoder().encode(contactGroups) {
            UserDefaults.standard.set(encodedGroupData, forKey: groupKey)
        }
    }
}
