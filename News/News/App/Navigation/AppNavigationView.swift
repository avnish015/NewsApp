//
//  AppNavigationView.swift
//  News
//
//  Created by Avnish Kumar on 05/07/24.
//

import SwiftUI

// MARK: - NavigationView
struct AppNavigationView: View {
  
  // MARK: - Property
  @StateObject var navigationManager = NavigationManager()

  // MARK: - Body
  var body: some View {
    NavigationStack(path: $navigationManager.path) {
      navigate(to: .articleList)
        .navigationDestination(for: Route.self) { page in
          navigate(to: page)
        }
    }
    .environmentObject(navigationManager)
  }
  
  @ViewBuilder
    private func navigate(to page: Route) -> some View {
        switch page {
        case .articleList:
            if let viewModel = try? AppDIContainer.shared.resolve(type: ArticleListViewModel.self) {
                ArticleListView(viewModel: viewModel)
            } else {
                ErrorView(description: DisplayStrings.Other.dependencyNotRegistered)
            }
        case .articleDetails(let article):
            if let viewModel = try? AppDIContainer.shared.resolve(type: ArticleDetailsViewModel.self, argument: article) {
                ArticleDetailsView(viewModel: viewModel)
                    .environmentObject(navigationManager)
            } else {
                ErrorView(description: DisplayStrings.Other.dependencyNotRegistered)
            }
        }
    }
}

#Preview {
  AppNavigationView()
}
