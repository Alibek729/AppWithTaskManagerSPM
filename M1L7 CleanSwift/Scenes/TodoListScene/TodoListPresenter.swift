//
//  TodoListPresenter.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.

import Foundation
import TaskManagePackage

protocol ITodoListPresenter {
	func present(responce: TodoListModel.Responce)
}

class TodoListPresenter:ITodoListPresenter {

	private weak var viewController: ITodoListViewController?

	init(viewController: ITodoListViewController) {
		self.viewController = viewController
	}

	func present(responce: TodoListModel.Responce) {
		var sections = [TodoListModel.ViewModel.Section]()

		for section in responce.data {
			let sectionData = TodoListModel.ViewModel.Section(
				title: section.section.title,
				tasks: mapTasksData(tasks: section.tasks)
			)

			sections.append(sectionData)
		}

		let viewModel = TodoListModel.ViewModel(taskBySection: sections)
		viewController?.render(viewModel: viewModel)
	}

	private func mapTasksData(tasks: [Task]) -> [TodoListModel.ViewModel.Task] {
		tasks.map { mapTaskData(task: $0) }
	}

	private func mapTaskData(task: Task) -> TodoListModel.ViewModel.Task {

		if let task = task as? ImportantTask {

			let result = TodoListModel.ViewModel.ImportantTask(
				name: task.title,
				isDone: task.completed,
				overdue: task.deadline < Date(),
				deadline: task.deadline.formatted(),
				priority: task.taskPriority.description
			)

			return .importantTask(result)
		} else {
			return .regularTask(TodoListModel.ViewModel.RegularTask(name: task.title, isDone: task.completed))
		}
	}

}
