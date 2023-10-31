//
//  CoordinatorModel.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import SwiftUI

enum Page: Hashable {
    case main
    case about(input: String, result: Binding<Int>)
    
    static func == (lhs: Page, rhs: Page) -> Bool {
        switch (lhs, rhs) {
        case (.main, .main): return true
        case (.about, .about): return true
        default: return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .main:
            hasher.combine(0)
        case .about(let input, let result):
            hasher.combine(1)
            hasher.combine(input.hashValue)
            hasher.combine(result.wrappedValue.hashValue)
        }
    }
}

class CoordinatorModel: ObservableObject {
    @ObservedObject var diProvider: DiProvider
    
    init(diProvider: DiProvider) {
        self.diProvider = diProvider
    }
    
    @Published var path = NavigationPath()
    
    func push(page: Page) { path.append(page) }
    
    func pop() { path.removeLast() }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .main: mainPage()
        case .about(let input, let result): aboutPage(input: input, result: result)
        }
    }

    func mainPage() -> some View {
        let vm: MainViewModel<CoordinatorModel> = diProvider.mainVmInstance()
        vm.coordinatorDelegate = ObservedObject(wrappedValue: self)
        return MainPage(viewModel: vm)
    }
}

extension CoordinatorModel: MainViewModelCoordinatorDelegate {
    
    func didPressedNext(input: String, result: Binding<Int>) {
        push(page: .about(input: input, result: result))
    }

    func aboutPage(input: String, result: Binding<Int>) -> some View {
        let vm: AboutViewModel<CoordinatorModel> = diProvider.aboutVmInstance(input: input, result: result)
        vm.coordinatorDelegate = ObservedObject(wrappedValue: self)
        return AboutPage(viewModel: vm)
    }
}

extension CoordinatorModel: AboutViewModelCoordinatorDelegate {
    func didPressedConfirm() {
        pop()
    }
}
