//
//  AboutViewModel.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import SwiftUI

protocol AboutViewModelCoordinatorDelegate: ObservableObject {
    func didPressedConfirm()
}

class AboutViewModel<CD: AboutViewModelCoordinatorDelegate>: ObservableObject {
    
    var service: MathService

    var coordinatorDelegate: ObservedObject<CD>? = nil
    
    @Published var counter: Int = 0;
    
    var someText: String
    @Binding var result: Int
    
    init(service: MathService, text: String? = nil, result: Binding<Int>? = nil) {
        self.service = service
        someText = text ?? "N / A"
        self._result = result ?? Binding(get: { 0 }, set: { _,_ in })
        counter = result?.wrappedValue ?? 0
    }
    
    func decrease() {
        counter = service.decrease(value: counter)
    }
    
    func confirm() {
        result = counter
        coordinatorDelegate?.wrappedValue.didPressedConfirm()
    }
}
