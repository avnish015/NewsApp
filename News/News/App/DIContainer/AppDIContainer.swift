//
//  AppDIContainer.swift
//  News
//
//  Created by Avnish Kumar on 13/02/24.
//

import Foundation
import Kingfisher

// MARK: - DIContainer
class AppDIContainer {
  
  // MARK: - Shared
  static let shared: AppDIContainer = .init()
  
  // MARK: - Preoperty
  private var dependencies: [String: Any] = [:]
  
  // MARK: - Function
  func register<T>(type: T.Type, dependency: T) {
    let key = String(describing: type)
    dependencies[key] = dependency
  }
  
  func register<T, Arg>(type: T.Type, dependency: @escaping (Arg) -> T) {
    let key = String(describing: type)
    dependencies[key] = { (arg: Arg) in
      return dependency(arg)
    }
  }
  
  func resolve<T>(type: T.Type)throws -> T {
    let key = String(describing: type)
    guard let dependency = dependencies[key] as? T else {
        throw NSError(domain: "com.Dependency.injection", code: -1, userInfo: [NSLocalizedDescriptionKey: "No Dependency found for - \(key), Application must be not register a dependency before resolving it."])
    }
    return dependency
  }
  
    func resolve<T, Arg>(type: T.Type, argument: Arg)throws -> T {
        let key = String(describing: type)
        guard let dependency = dependencies[key] as? (Arg) -> T else {
            throw NSError(domain: "com.Dependency.injection", code: -1, userInfo: [NSLocalizedDescriptionKey: "No Dependency found for - \(key), Application must be not register a dependency before resolving it."])
        }
        return dependency(argument)
    }
}
