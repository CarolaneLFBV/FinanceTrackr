//
//  CreateNotificatonView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 18/09/2023.
//

import SwiftUI

struct CreateNotificationView: View {
    @ObservedObject var notificationManager: NotificationManager
    @State private var title: String = ""
    @State private var date = Date()
    @State private var description: String = ""
    @Binding var isPresented: Bool
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack {
                        Text("Please enter the title and the time of your notification.")
                        
                        VStack {
                            HStack {
                                TextField("Title", text: $title)
                                    .padding()
                                    .background(.red)
                                DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                                    .padding()
                            }
                            
                            TextEditor(text: $description)
                                .padding()
                                .background(.blue)
                        }
                        .background(colorScheme == .dark ? Color(UIColor.white).opacity(0.2) : Color(UIColor.lightGray).opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                        
                        Button("Create Notification") {
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
                            guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return }
                            notificationManager.createLocalNotification(title: title, body: description, hour: hour, minute: minute) { error in
                                if error == nil {
                                    DispatchQueue.main.async {
                                        self.isPresented = false
                                    }
                                }
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .listRowBackground(Color(.systemGroupedBackground))
                }
            }
            .onDisappear {
                notificationManager.reloadLocalNotifications()
            }
            .navigationTitle("Create a notification")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button() {
                        isPresented = false
                    }label: {
                        Image(systemName: "xmark")
                    }
                }
            })
            
        }
    }
}

struct CreateNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNotificationView(notificationManager: NotificationManager(), isPresented: .constant(false))
    }
}
