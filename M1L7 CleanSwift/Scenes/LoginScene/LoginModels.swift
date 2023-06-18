//
//  LoginModels.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import Foundation

enum LoginModels {

	struct Request {
		var login: String
		var password: String
	}

	struct Responce {
		var success: Bool
	}

	enum ViewModel {
		case success
		case failure(String)
	}
}
