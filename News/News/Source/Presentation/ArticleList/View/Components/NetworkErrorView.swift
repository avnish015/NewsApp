//
//  NetworkErrorView.swift
//  News
//
//  Created by Avnish Kumar on 15/01/24.
//

import SwiftUI

struct NetworkErrorView: View {
    var description: String
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
            Button(DisplayStrings.ArticleList.retry) {
                callBack?()
            }
        }
        .font(.system(size: 15))
    }
}

#if DEBUG
struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorView(description: DisplayStrings.ArticleList.errorTitle)
    }
}
#endif
