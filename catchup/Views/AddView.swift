//
//  AddView.swift
//  catchup
//
//  Created by Kat Kat on 4/9/22.
//

import SwiftUI
/*
 view for adding a person to the list
 */
struct AddView: View {
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
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
            .navigationTitle("Add a Family Member 👤")
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
    func addNotification() {
        let content = UNMutableNotificationContent()
        content.title = "catchup"
        content.subtitle = "Catch-up with \(textFieldText)!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    //Remove Request for Notification
    func deleteNotification() {
        
    }
    
    func saveButtonPressed() {
        Notification() // popup to change notifications
        if fieldsAppropriate() {
            listViewModel.addPerson(name: textFieldText, frequency: Int(frequencyFieldText) ?? 7)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func fieldsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "😵‍💫\nYou must include a name for your family member."
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}


