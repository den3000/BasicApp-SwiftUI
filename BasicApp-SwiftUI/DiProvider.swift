//
//  DiProvider.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import SwiftUI

// class my di provider

class MyDiContainer: DiContainerProtocol {
    func increment() -> Int { 1 }
}

class DiProvider: ObservableObject {
    let container = MyDiContainer()
    
    lazy var service = container.mathService()
    
    func mainVmInstance<CD: MainViewModelCoordinatorDelegate>() -> MainViewModel<CD> {
        return MainViewModel<CD>(service: service)
    }
    
    func aboutVmInstance<CD: AboutViewModelCoordinatorDelegate>(input: String, result: Binding<Int>) -> AboutViewModel<CD> {
        return AboutViewModel<CD>(service: service, text: input, result: result)
    }
}
