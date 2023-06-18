//
//  ISectionForTaskManager.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import TaskManagePackage

protocol ISectionForTaskManagerAdapter {
	func getSections() -> [Section]
	func getSectionIndex(section: Section) -> Int
	func getSection(forIndex index: Int) -> Section
	func getTasksForSection(section: Section) -> [Task]
	func getTaskSectionAndIndex(task: Task) -> (section: Section, index: Int)?
}

enum Section: CaseIterable {
	case completed
	case uncompleted

	var title: String {
		switch self {

		case .completed:
			return "Completed"
		case .uncompleted:
			return "Uncompleted"
		}
	}
}
