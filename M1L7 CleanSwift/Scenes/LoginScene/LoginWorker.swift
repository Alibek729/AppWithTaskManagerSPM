//
//  LoginWorker.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import Foundation

protocol ILoginWorker {
	func login(login: String, password: String) -> Bool
}

class LoginWorker: ILoginWorker {

	private let validLogin = "Ali"
	private let validPassword = "123"

	func login(login: String, password: String) -> Bool {
		login == validLogin && password == validPassword
	} 
}
