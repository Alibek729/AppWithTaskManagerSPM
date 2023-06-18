//
//  TodoListViewController.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import UIKit

protocol ITodoListViewController: AnyObject {
	func render(viewModel: TodoListModel.ViewModel)
}

class TodoListViewController: UITableViewController {

	var interactor: ITodoListInteractor?
	private var viewModel: TodoListModel.ViewModel = TodoListModel.ViewModel(taskBySection: [])

    override func viewDidLoad() {
        super.viewDidLoad()
		title = "TodoList"

		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.dataSource = self
		tableView.delegate = self
		interactor?.fetchData()
    }

    // MARK: - Table view data source

	//MARK: - numberOfSections

    override func numberOfSections(in tableView: UITableView) -> Int {
		viewModel.taskBySection.count
    }

	//MARK: - titleForHeaderInSection

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewModel.taskBySection[section].title
	}

	//MARK: - numberOfRowsInSection

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.taskBySection[section].tasks.count
    }

	//MARK: - cellForRowAt

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tasks = viewModel.taskBySection[indexPath.section].tasks
		let taskData = tasks[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		var contentCobfiguration = cell.defaultContentConfiguration()


		switch taskData {

		case .regularTask(let task):
			contentCobfiguration.text = task.name
			cell.accessoryType = task.isDone ? .checkmark : .none
		case .importantTask(let task):
			let redText = [NSAttributedString.Key.foregroundColor: UIColor.red]
			let taskText = NSMutableAttributedString(string: "\(task.priority)", attributes: redText)
			taskText.append(NSAttributedString(string: task.name))

			contentCobfiguration.attributedText = taskText
			contentCobfiguration.secondaryText = task.deadline
			contentCobfiguration.secondaryTextProperties.color = task.overdue ? .red : .black

			cell.accessoryType = task.isDone ? .checkmark : .none
		}

		contentCobfiguration.textProperties.font = UIFont.systemFont(ofSize: 19)
		contentCobfiguration.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)

		cell.tintColor = .red
		cell.contentConfiguration = contentCobfiguration

		return cell
	}

	//MARK: - didSelectRowAt
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		interactor?.didTaskSelected(atIndex: TodoListModel.Request.TaskSelected(indexPath: indexPath))
	}

}

//MARK: - Extension

extension TodoListViewController: ITodoListViewController {
	func render(viewModel: TodoListModel.ViewModel) {
		self.viewModel = viewModel
		tableView.reloadData()
	}
}
