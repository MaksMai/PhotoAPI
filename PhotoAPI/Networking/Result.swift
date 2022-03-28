//
//  Result.swift
//  PhotoAPI
//
//  Created by Maksim Maiorov on 11.03.2022.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
