//
//  LoginRouter.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import UIKit

protocol ILoginRouter {
	func routeToTodoList()
	func showError(message: String)
}

final class LoginRouter: ILoginRouter {

	private weak var loginViewController: UIViewController!
	private let todoListViewController: UIViewController

	internal init(loginViewController: UIViewController, todoListViewController: UIViewController) {
		self.loginViewController = loginViewController
		self.todoListViewController = todoListViewController
	}

	func routeToTodoList() {
		loginViewController.present(todoListViewController, animated: true)
	}

	func showError(message: String) {
		let alert: UIAlertController
		alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)

		let action = UIAlertAction(title: "Ok", style: .default)

		alert.addAction(action)

		loginViewController.present(alert, animated: true, completion: nil)
	}
}
