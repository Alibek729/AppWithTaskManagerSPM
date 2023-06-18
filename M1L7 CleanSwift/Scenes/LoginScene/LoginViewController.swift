//
//  LoginViewController.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import UIKit

protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

class LoginViewController: UIViewController {

	var interactor: ILoginInteractor?
	var router: ILoginRouter?

	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPassword: UITextField!

	@IBAction func loginPressed(_ sender: UIButton) {

		if let email = textFieldLogin.text, let password = textFieldPassword.text {
			let request = LoginModels.Request(login: email, password: password)
			interactor?.login(request: request)
		}
	}
}

extension LoginViewController: ILoginViewController {
	func render(viewModel: LoginModels.ViewModel) {

		switch viewModel {
		case .success:
			router?.routeToTodoList()
		case .failure(let message):
			router?.showError(message: message)
		}
	}
}
