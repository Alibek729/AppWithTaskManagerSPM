//
//  TodoListInteractor.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import Foundation

protocol ITodoListInteractor {
	func fetchData()
	func didTaskSelected(atIndex index: TodoListModel.Request.TaskSelected)
}

class TodoListInteractor: ITodoListInteractor {

	private let sectionManager: ISectionForTaskManagerAdapter
	private let presenter: ITodoListPresenter

	internal init(sectionManager: ISectionForTaskManagerAdapter, presenter: ITodoListPresenter) {
		self.sectionManager = sectionManager
		self.presenter = presenter
	}
	
	func fetchData() {
		var responceData = [TodoListModel.Responce.SectionWithTasks]()

		for section in sectionManager.getSections() {
			let sectionWithTasks = TodoListModel.Responce.SectionWithTasks(
				section: section,
				tasks: sectionManager.getTasksForSection(section: section)
			)

			responceData.append(sectionWithTasks)
		}
		
		let responce = TodoListModel.Responce(data: responceData)
		presenter.present(responce: responce)
	}

	func didTaskSelected(atIndex index: TodoListModel.Request.TaskSelected) {
		let section = sectionManager.getSection(forIndex: index.indexPath.section)
		let task = sectionManager.getTasksForSection(section: section)[index.indexPath.row]
		task.completed.toggle()
		fetchData()
	}
}
