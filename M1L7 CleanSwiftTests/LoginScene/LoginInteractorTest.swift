//
//  M1L7_CleanSwiftTests.swift
//  M1L7 CleanSwiftTests
//
//  Created by Alibek Kozhambekov on 19.06.2023.
//

import XCTest
@testable import M1L7_CleanSwift

final class LoginInteractorTest: XCTestCase {

	private let worker = LoginWorkerSpy()
	private let presenter = LoginPresenterSpy()

	func test_login_shouldBeSuccess() {
		let sut = makeSUT()
		let request = LoginModels.Request(login: "login", password: "password")

		sut.login(request: request)

		XCTAssertTrue(worker.isCalledLogin, "Worker.login не сработал")
		XCTAssertTrue(presenter.isCalledPresenter, "Presenter.present не сработал  ")
	}
}

private extension LoginInteractorTest {
	func makeSUT() -> ILoginInteractor {
		return LoginInteractor(worker: worker, presenter: presenter)
	}
}

class LoginWorkerSpy: ILoginWorker {

	private(set) var isCalledLogin = false

	func login(login: String, password: String) -> Bool {
		isCalledLogin = true
		return true
	}
}

class LoginPresenterSpy: ILoginPresenter {

	private(set) var isCalledPresenter = false

	func present(responce: M1L7_CleanSwift.LoginModels.Responce) {
		isCalledPresenter = true
	}

}
