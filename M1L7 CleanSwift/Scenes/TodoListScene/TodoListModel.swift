//
//  TodoListModel.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import Foundation
import TaskManagePackage

enum TodoListModel {

	/// Reuests for update, when task is selected
	enum Request {
		struct TaskSelected {
			/// Index of task, that has been selected
			let indexPath: IndexPath
		}
	}

	struct Responce {
		struct SectionWithTasks {
			let section: Section
			let tasks: [Task]
		}
		let data: [SectionWithTasks]
	}

	struct ViewModel {

		struct RegularTask {
			let name: String
			let isDone: Bool
		}

		struct ImportantTask {
			let name: String
			let isDone: Bool
			let overdue: Bool
			let deadline: String
			let priority: String
		}

		enum Task {
			case regularTask(RegularTask)
			case importantTask(ImportantTask)
		}

		struct Section {
			let title: String
			let tasks: [Task]
		}

		let taskBySection: [Section]
	}

}
