//
//  MainPage.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import SwiftUI

struct MainPage<CD: MainViewModelCoordinatorDelegate, VM: MainViewModel<CD>>: View {

    @StateObject var viewModel: VM
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Counter: \(viewModel.counter)")
            
            Button("Increase") {
                viewModel.increase()
            }
            
            Button("Next") {
                viewModel.next(binding: $viewModel.counter)
            }
        }.navigationTitle("Main Page")
    }
}

class MainViewModelCoordinatorDelegate_Preview: MainViewModelCoordinatorDelegate {
    func didPressedNext(input: String, result: Binding<Int>) { }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainPage(viewModel: MainViewModel<MainViewModelCoordinatorDelegate_Preview>(service: MathService(increment: 1)))
        }
    }
}
