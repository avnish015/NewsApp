//
//  ErrorView.swift
//  News
//
//  Created by Avnish Kumar on 15/01/24.
//

import SwiftUI

struct ErrorView: View {

    var description: String
    var buttonTitle: String?
    var callBack: (() -> Void)?

    var body: some View {
        VStack(spacing: 12) {
            VStack {
                Image.warning
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
                Text(description)
                    .foregroundColor(.gray)
            }
            if let buttonTitle {
                Button(buttonTitle) {
                    callBack?()
                }
            }
        }
        .font(.system(size: 15))
    }
}

#if DEBUG
#Preview {
    ErrorView(description: DisplayStrings.ArticleList.errorTitle, buttonTitle: DisplayStrings.ArticleList.retry)
}
#endif
