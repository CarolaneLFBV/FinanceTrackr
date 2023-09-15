//
//  Extension-BindingOptionals.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 15/09/2023.
//

import SwiftUI

extension Binding {
    public func defaultValue<T>(_ value: T) -> Binding<T> where Value == Optional<T> {
        Binding<T> {
            wrappedValue ?? value
        } set: {
            wrappedValue = $0
        }
    }
}
