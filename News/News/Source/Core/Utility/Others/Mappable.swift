//
//  Mappable.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

protocol Mappable {
    associatedtype Input
    associatedtype Output
    func toModel(_ input: Input) -> Output
}
