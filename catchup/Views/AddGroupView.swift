//
//  AddGroupView.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import SwiftUI
import UserNotifications

/*
 view for adding a group to the list
 */
struct AddGroupView: View {
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var groupViewModel: GroupViewModel
    @EnvironmentObject var notificationHandler: NotificationHandler
    @State var textFieldText: String = ""
    
    @State var frequencyFieldText: String = ""
    
    var body: some View {
        VStack{
            VStack {
                //define text field with "name" as background with pointer $textfieldtext
                TextField("group", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color("skyBlue").opacity(0.3))
                .cornerRadius(6)
                
                //another text field for the frequency data (if we decide to set group-wide settings)
                //TextField("contact this group every # of days", text: $frequencyFieldText)
                //    .padding(.horizontal)
                //    .frame(height: 60)
                //    .background(Color("skyBlue").opacity(0.3))
                //.cornerRadius(6)
                
                //save button
                Button(action: saveButtonPressed,   label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: 65, height: 35)
                        .background(Color("darkBlue"))
                        .cornerRadius(6)
                        
                } )
            }
            .padding()
            .navigationTitle("Add Group")
            //.alert(isPresented: $showAlert, content: getAlert)
            Spacer()
        }
    }
    
    // NOTIFICATIONS PROBABLY NOT NEEDED FOR GROUP
    /*private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    //ask for permission
    private func Notification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge,
            .sound]) { success, error in
                if success {
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        let content = UNMutableNotificationContent()
        content.title = "catchup"
        content.subtitle = "Catch-up with \(textFieldText)!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    //Submit Request for Notification
    private func addNotification(person: PersonModel) {
        let content = UNMutableNotificationContent()
        content.title = "catchup"
        content.subtitle = "Catch-up with \(textFieldText)!"
        content.sound = UNNotificationSound.default
        var interval: Double = Double(person.frequency * 24 * 60 * 60)
        interval += 40
        print(interval)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:
                                                            interval, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        notificationHandler.recordNotification(person: person, notif: request)
    }*/
    
    //add person to the list
    private func saveButtonPressed() {
        //Notification() // popup to change notifications
        if fieldsAppropriate() {
            //create person object
            //let num = Int(frequencyFieldText) ?? 7
            //let date: Date = Date.now.addingTimeInterval(Double(24*60*60*num))
            //let group = GroupModel(name: textFieldText)
            groupViewModel.addGroup(name: textFieldText)
            presentationMode.wrappedValue.dismiss()
            //addNotification(person: person)
        }
    }
    
    //check if person has proper name
    private func fieldsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "😵‍💫\nYou must include a group name"
            showAlert.toggle()
            return false
        }
        return true
    }
}

//preview provider
struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddGroupView()
        }
        .environmentObject(ListViewModel())
        .environmentObject(GroupViewModel())
    }
}
