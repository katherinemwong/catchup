//
//  AddViewFriends.swift
//  catchup
//
//  Created by John Adams on 4/10/22.
//

import SwiftUI
import UserNotifications
/*
 view for adding a person to the list
 */
struct AddViewFriends: View {
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @EnvironmentObject var notificationHandler: NotificationHandler
    @State var textFieldText: String = ""
    
    @State var frequencyFieldText: String = ""
    
    var body: some View {
        VStack{
            VStack {
                TextField("name", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color("skyBlue").opacity(0.3))
                .cornerRadius(6)
                
                TextField("contact this person every # of days", text: $frequencyFieldText)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color("skyBlue").opacity(0.3))
                .cornerRadius(6)
                
                Button(action: saveButtonPressed,   label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: 65, height: 35)
                        .background(Color("darkBlue"))
                        .cornerRadius(6)
                        
                } )
            }
            .padding()
            .navigationTitle("Add a Friend 👤")
            .alert(isPresented: $showAlert, content: getAlert)
            Spacer()
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func Notification() {
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
    func addNotification(person: personModel) {
        let content = UNMutableNotificationContent()
        content.title = "catchup"
        content.subtitle = "Catch-up with \(textFieldText)!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:
                                                            Double(person.frequency)*24*60*60 + 30, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        notificationHandler.recordNotification(person: person, notif: request)
    }
    
    func saveButtonPressed() {
        Notification() // popup to change notifications
        if fieldsAppropriate() {
            let num = Int(frequencyFieldText) ?? 7
            let date: Date = Date.now.addingTimeInterval(Double(24*60*60*num))
            let person = personModel(name: textFieldText, dateToContact: date, frequency: num)
            listViewModel.addFriend(newPerson: person)
            presentationMode.wrappedValue.dismiss()
            addNotification(person: person)
        }
    }
    
    func fieldsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "😵‍💫\nYou must include a name for your friend."
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddViewFriends_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddViewFriends()
        }
        .environmentObject(ListViewModel())
    }
}


