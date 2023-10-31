//
//  AboutPage.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import SwiftUI

struct AboutPage<CD: AboutViewModelCoordinatorDelegate, VM: AboutViewModel<CD>>: View {
    
    @StateObject var viewModel: VM
    
    var body: some View {
        VStack(spacing: 32) {
            Text("\(viewModel.someText)")
            
            Text("Decreased to: \(viewModel.counter)")
           
            Button("Decrease") {
                viewModel.decrease()
            }
            
            Button("Confirm") {
                viewModel.confirm()
            }
        }
        .navigationTitle("About Page")
    }
}

class AboutViewModelCoordinatorDelegate_Preview: AboutViewModelCoordinatorDelegate {
    func didPressedConfirm() { }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AboutPage(
                viewModel: AboutViewModel<AboutViewModelCoordinatorDelegate_Preview>(service: MathService())
            )
        }
    }
}
