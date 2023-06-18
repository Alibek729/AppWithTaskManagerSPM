//
//  TaskRepository.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import TaskManagePackage

protocol ITaskRepository {
	func getTasks() -> [Task]
}

class TaskRepository: ITaskRepository {
	func getTasks() -> [Task] {
		[
			ImportantTask(title: "Do homework", taskPriority: .high),
			RegularTask(title: "Do workout", completed: true),
			ImportantTask(title: "Write new tasks", taskPriority: .low),
			RegularTask(title: "Solve 3 questions"),
			ImportantTask(title: "Go shopping", taskPriority: .medium)
		]
	}
}
