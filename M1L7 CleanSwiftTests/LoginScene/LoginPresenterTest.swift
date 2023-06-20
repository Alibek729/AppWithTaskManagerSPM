//
//  LoginPresenterTest.swift
//  M1L7 CleanSwiftTests
//
//  Created by Alibek Kozhambekov on 19.06.2023.
//

import XCTest
@testable import M1L7_CleanSwift

final class LoginPresenterTest: XCTestCase {

	private let viewController = LoginViewControllerSpy()

	func test_present_withValidRequest_shouldRenderSuccess() {
		let sut = makeSUT()
		let responce = LoginModels.Responce(success: true)

		sut.present(responce: responce)

		XCTAssertTrue(viewController.isCalledRender, "viewController.render не был вызван")
		XCTAssertTrue(viewController.viewModel, "Ошибка в viewModel - не валидный результат")
	}

	func test_present_withUnvalidRequest_shouldFail() {
		let sut = makeSUT()
		let responce = LoginModels.Responce(success: false)

		sut.present(responce: responce)

		XCTAssertTrue(viewController.isCalledRender, "viewController.render не был вызван")
		XCTAssertFalse(viewController.viewModel, "Ошибка в viewModel - валидный результат")
	}
}

private extension LoginPresenterTest {
	func makeSUT() -> LoginPresenter {
		LoginPresenter(viewController: viewController)
	}
}

//MARK: - LoginViewControllerSpy

class LoginViewControllerSpy: ILoginViewController {

	//MARK: - Internal properties

	private(set) var isCalledRender = false
	private(set) var viewModel = false

	//MARK: - Internal Methods

	func render(viewModel: M1L7_CleanSwift.LoginModels.ViewModel) {
		isCalledRender = true

		if case .success = viewModel {
			self.viewModel = true
		}
	}
}
