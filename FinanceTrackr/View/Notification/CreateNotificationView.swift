//
//  CreateNotificationView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 23/09/2023.
//

import SwiftUI

struct CreateNotificationView: View {
    @ObservedObject var notificationManager: NotificationManager
    @State private var title: String = ""
    @State private var date = Date()
    @State private var description: String = ""
    @Binding var isPresented: Bool
    
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        Text("Please enter the title and the time of your notification.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.blue)
                    
                        
                        VStack {
                            HStack {
                                TextField("Title", text: $title)
                                DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                            }
                            .padding()
                            
                            TextField("Description", text: $description)
                                .padding()
                        }
                        .background(.gray.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                        
                        Button("Create Notification") {
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
                            guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return }
                            notificationManager.createLocalNotification(title: title, body: description, hour: hour, minute: minute) { error in
                                if error == nil {
                                    DispatchQueue.main.async {
                                        dismiss()
                                    }
                                }
                            }
                        }
                        .buttonStyle(.bordered)
                        .disabled(title.isEmpty)
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
                        dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundStyle(.blue)
                    }
                }
            })
            
        }
    }
}

#Preview {
    CreateNotificationView(notificationManager: NotificationManager(), isPresented: .constant(false))
}

