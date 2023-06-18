//
//  SectionForTaskManager.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import TaskManagePackage

class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {

	private let sections: [Section] = [.uncompleted, .completed]
	private let taskManager: ITaskManager

	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}

	func getSections() -> [Section] {
		sections
	}

	func getSectionIndex(section: Section) -> Int {
		sections.firstIndex(of: section) ?? 0
	}

	func getSection(forIndex index: Int) -> Section {
		let i = min(index, sections.count - 1)
		return sections[i]
	}

	func getTasksForSection(section: Section) -> [Task] {
		switch section {

		case .completed:
			return taskManager.completedTasks()
		case .uncompleted:
			return taskManager.uncompletedTasks()
		}
	}

	func getTaskSectionAndIndex(task: Task) -> (section: Section, index: Int)? {

		for section in sections {
			let index = getTasksForSection(section: section).firstIndex { task === $0 }

			if index != nil {
				return (section, index!)
			}
		}

		return nil
	}
}
