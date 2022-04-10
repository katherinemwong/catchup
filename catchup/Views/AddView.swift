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
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var frequencyFieldText: String = ""
    
    var body: some View {
        ScrollView {
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
            
        }
        .navigationTitle("Add a Family Member 👤")
        
    }
    
    func Notification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge,
            .sound]) { success, error in
                if success {
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
    }
    
    func saveButtonPressed() {
        if fieldsAppropriate() {
            listViewModel.addPerson(name: textFieldText, frequency: Int(frequencyFieldText) ?? 7)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func fieldsAppropriate() -> Bool {
        if textFieldText.count < 3 {return false}
        print("step 1")
        print("\(Int(textFieldText))")
    }
        // popup to change notifications
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}


