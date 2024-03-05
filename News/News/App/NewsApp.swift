//
//  NewsApp.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI

@main
struct NewsApp: App {
    
    let appDIContainer = AppDIContainer()

    var body: some Scene {
        let articleListView = appDIContainer.makeArticleListView()
        return WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    articleListView
                        .environmentObject(appDIContainer)
                }
            } else {
                NavigationView {
                    articleListView
                        .environmentObject(appDIContainer)
                }
                .navigationViewStyle(.stack)
            }
        }
    }
}
