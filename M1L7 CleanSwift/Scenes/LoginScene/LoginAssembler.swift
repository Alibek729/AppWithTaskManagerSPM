//
//  LoginAssembler.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import UIKit

final class LoginAssembler {

	func assembly() -> UIViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

		guard let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
			fatalError()
		}

		let presenter = LoginPresenter(viewController: viewController)
		let worker = LoginWorker()
		let interactor = LoginInteractor(worker: worker, presenter: presenter)

		viewController.interactor = interactor

		return viewController
	}
}
