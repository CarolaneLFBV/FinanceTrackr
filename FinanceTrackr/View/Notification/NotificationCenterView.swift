//
//  NotificationCenterVieqw.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 23/09/2023.
//

import SwiftUI

extension NotificationCenterView {
    func delete(_ indexSet: IndexSet) {
        notificationManager.deleteLocalNotification (
            identifiers: indexSet.map {
                notificationManager.notifications[$0].identifier
            }
        )
        notificationManager.reloadLocalNotifications()
    }
}


struct NotificationCenterView: View {
    @StateObject private var notificationManager = NotificationManager()
    @State private var isCreateNotificationPresented: Bool = false
    
    @ViewBuilder
    var infoOverlayView: some View {
        switch notificationManager.authorizationStatus {
        case .authorized:
            if notificationManager.notifications.isEmpty {
                InfoOverlayView(
                    infoMessage: "No Notification. Add a notification here",
                    buttonTitle: "Create notification",
                    systemImageName: "plus.circle",
                    action: {
                        isCreateNotificationPresented = true
                    })
            }
        case .denied:
            InfoOverlayView(infoMessage: "Please enable Notification Permission In Settings",
                            buttonTitle: "Settings",
                            systemImageName: "gear",
                            action: {
                if let url = URL(string: UIApplication.openSettingsURLString),
                   UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            })
        default:
            EmptyView()
        }
    }
    
    var body: some View {
        List {
            ForEach(notificationManager.notifications, id:\.identifier) { notification in
                HStack {
                    VStack(alignment: .leading) {
                        Text(notification.content.title)
                            .fontWeight(.medium)
                        Spacer()
                            .frame(height: 10)
                        Text(notification.content.body)
                            .font(.caption)
                    }
                    
                    Spacer()
                    Text(notificationManager.timeDisplayText(from: notification))
                        .foregroundStyle(.blue)
                }
            }
            .onDelete(perform: delete)
        }
        .listStyle(InsetGroupedListStyle())
        .overlay(infoOverlayView)
        .navigationTitle("Notifications")
        .onAppear(perform: notificationManager.reloadAuthorizationStatus)
        .onChange(of: notificationManager.authorizationStatus) { authorizationStatus in
            switch authorizationStatus {
            case .notDetermined:
                notificationManager.requestAuthorization()
            case .authorized:
                notificationManager.reloadLocalNotifications()
            default:
                break
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button() {
                    isCreateNotificationPresented = true
                }label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
            }
        })
        .sheet(isPresented: $isCreateNotificationPresented) {
                CreateNotificationView(notificationManager: notificationManager, isPresented: $isCreateNotificationPresented)
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            notificationManager.reloadAuthorizationStatus()
        }
    }
}

#Preview {
    NotificationCenterView()
}
