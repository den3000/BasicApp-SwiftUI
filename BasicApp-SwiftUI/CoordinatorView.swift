//
//  CoordinatorView.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = CoordinatorModel(diProvider: DiProvider())
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: Page.main)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
