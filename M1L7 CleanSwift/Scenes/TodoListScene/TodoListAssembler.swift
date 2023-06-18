//
//  TodoListAssembler.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import UIKit
import TaskManagePackage

final class TodoListAssembler {

	func assembly() -> UIViewController {

		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

		guard let viewController = storyboard.instantiateViewController(withIdentifier: "TodoListViewController") as? TodoListViewController else {
			fatalError("TodoListViewController not found in main")
		}

		let taskManager = OrderedTaskManager(taskManager: TaskManager())
		let repository: ITaskRepository = TaskRepository()
		taskManager.addTasks(tasks: repository.getTasks())
		let sectionManagerAdapter = SectionForTaskManagerAdapter(taskManager: taskManager)

		let presenter = TodoListPresenter(viewController: viewController)
		let interactor = TodoListInteractor(sectionManager: sectionManagerAdapter, presenter: presenter)
		viewController.interactor = interactor

		return viewController
	}
}

