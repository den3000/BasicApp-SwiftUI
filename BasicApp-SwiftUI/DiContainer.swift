//
//  DiContainer.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import Foundation
import SwiftUI

class DiContainer {
    
    func mathService() -> MathService {
        return MathService()
    }
    
    func mainVmInstance<CD: MainViewModelCoordinatorDelegate>(service: MathService) -> MainViewModel<CD> {
        return MainViewModel<CD>(service: service)
    }
    
    func aboutVmInstance<CD: AboutViewModelCoordinatorDelegate>(service: MathService, input: String, result: Binding<Int>) -> AboutViewModel<CD> {
        return AboutViewModel<CD>(service: service, text: input, result: result)
    }
}
