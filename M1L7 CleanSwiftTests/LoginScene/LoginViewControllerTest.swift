//
//  LoginViewControllerTest.swift
//  M1L7 CleanSwiftTests
//
//  Created by Alibek Kozhambekov on 19.06.2023.
//

import XCTest
@testable import M1L7_CleanSwift

final class LoginViewControllerTest: XCTestCase {
	private var interactor: LoginInteractorSpy!
	private var window: UIWindow!
	private var sut: LoginViewController!

	override func setUp() {
		super.setUp()

		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController

		interactor = LoginInteractorSpy()
		sut.interactor = interactor
		window = UIWindow()
		window.addSubview(sut.view)

		RunLoop.current.run(until: Date())
	}

	override func tearDown() {
		sut = nil
		window = nil
		interactor = nil

		super.tearDown()
	}

	func test_render_withValidRequest_shouldLogin() {
		sut.loginText = "validLogin"
		sut.passText = "validPass"

		sut.loginPressed(sut!)

		XCTAssertTrue(interactor.isCalledLogin, "interactor.login не был вызван")
	}
}

class LoginInteractorSpy: ILoginInteractor {

	private(set) var isCalledLogin = false
	private(set) var request = false

	func login(request: M1L7_CleanSwift.LoginModels.Request) {
		isCalledLogin = true
	}
}
