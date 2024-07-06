//
//  NavigationManager.swift
//  News
//
//  Created by Avnish Kumar on 05/07/24.
//

import Foundation

import SwiftUI

// MARK: - RouteProtocol
protocol RouteProtocol: Hashable, Identifiable {
  var id: String { get }
}

// MARK: - Route
enum Route: RouteProtocol {
  
  case articleList
  case articleDetails(Article)
  
  var id: String {
    switch self {
    case .articleList:
      return "ArticleList"
    case .articleDetails:
      return "ArticleDetails"
    }
  }
}

// MARK: - NavigationManagerProtocol
protocol NavigationManagerProtocol: ObservableObject {
  associatedtype RoutePage: RouteProtocol
  var path: NavigationPath { get set }
  
  func push(_ page: RoutePage)
  func pop()
  func popToRoot()
}

// MARK: - NavigationManager
public class NavigationManager: NavigationManagerProtocol {
  typealias RoutePage = Route
  @Published var path = NavigationPath()
  
  func push(_ page: Route) {
    path.append(page)
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
  }
}
