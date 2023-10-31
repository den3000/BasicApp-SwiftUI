//
//  MainViewModel.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import SwiftUI

protocol MainViewModelCoordinatorDelegate: ObservableObject {
    func didPressedNext(input: String, result: Binding<Int>)
}

class MainViewModel<CD: MainViewModelCoordinatorDelegate>: ObservableObject {
    
    var service: MathService
    
    var coordinatorDelegate: ObservedObject<CD>? = nil
    
    @Published private var someText: String = "Some Main Page Text"
    @Published var counter: Int = 0;
        
    init(service: MathService) {
        self.service = service
    }
    
    func next(binding: Binding<Int>) {
        coordinatorDelegate?.wrappedValue.didPressedNext(input: "Counter increased to: \(counter)", result: binding)
    }
    
    func increase() {
        counter = service.increase(value: counter)
    }
}
