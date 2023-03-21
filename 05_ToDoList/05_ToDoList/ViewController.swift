//
//  ViewController.swift
//  04_ToDoList
//
//  Created by Lim on 2023/03/16.
//

import UIKit

class ViewController: UIViewController
{

	// weak로 선언되게 되면 다른 버튼으로 교체될 떄, 메모리에서 제거가 되기 떄문에
	// strong으로 선언되어야 한다.
	@IBOutlet var editButton: UIBarButtonItem!
	@IBOutlet weak var tableView: UITableView!
	
	var doneButton: UIBarButtonItem?
	var tasks = [Task]()
	{
		didSet
		{
			self.saveTasks()
		}
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		self.doneButton = UIBarButtonItem(barButtonSystemItem: .done,
										  target: self,
										  action: #selector(doneButtonTap))
		self.tableView.dataSource = self
		self.tableView.delegate = self
		
		self.loadTasks()
	}
	
	@objc func doneButtonTap()
	{
		self.navigationItem.leftBarButtonItem = self.editButton
		self.tableView.setEditing(false, animated: true)
	}

	@IBAction func tapEditButton(_ sender: UIBarButtonItem)
	{
		print(#function)
		guard !self.tasks.isEmpty else { return }
		self.navigationItem.leftBarButtonItem = self.doneButton
		self.tableView.setEditing(true, animated: true)
	}
	
	@IBAction func tapAddButton(_ sender: UIBarButtonItem)
	{
		print(#function)
		let alert = UIAlertController(title: "할 일 등록",
									  message: nil,
									  preferredStyle: .alert)
		
		let registerButton = UIAlertAction(title: "등록", style: .default)
		{	[weak self] _ in
			guard let title = alert.textFields?[0].text else { return }
			let task: Task = .init(title: title, done: false)
			self?.tasks.append(task)
			self?.tableView.reloadData()
		}
		let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
		
		alert.addAction(cancelButton)
		alert.addAction(registerButton)
		alert.addTextField()
		{	textField in
			textField.placeholder = "할 일을 입력해주세요"
			
		}
		self.present(alert, animated: true, completion: nil)
	}
	
	func saveTasks()
	{
		let data = self.tasks.map
		{
			[
				"title": $0.title,
				"done": $0.done
			]
		}
		let userDefaults = UserDefaults.standard
		userDefaults.set(data, forKey: "tasks")
	}
	
	func loadTasks()
	{
		let userDefaults = UserDefaults.standard
		guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
		self.tasks = data.compactMap
		{
			guard let title = $0["title"] as? String else { return nil }
			guard let done = $0["done"] as? Bool else { return nil }
			return Task(title: title, done: done)
		}
	}
	
}

extension ViewController: UITableViewDataSource
{
	// 특정 세션에 대해서 행의 개수를 어떻게 반환할 것인가?
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return self.tasks.count
	}
	
	// 특정 index에 대해서 어떠한 Cell을 반환할 것인가?
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		// 큐를 사용해서 셀을 재사용함. (필요한만큼 가져와서 사용하기 위해) == SwiftUI의 Lazy View
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		// indexPath -> session, row
		// 초기 셀의 값은 session:0 , row:0인 경우
		let task = self.tasks[indexPath.row]
		cell.textLabel?.text = task.title
		cell.accessoryType = task.done ? .checkmark : .none
		return cell
	}
	
	// 편집모드에서 삭제버튼이 눌러진 셀에 어떠한 작업을 할 것인가?
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
	{
		self.tasks.remove(at: indexPath.row)
		tableView.deleteRows(at: [indexPath], with: .automatic)
		
		if self.tasks.isEmpty
		{
			self.doneButtonTap()
		}
	}
	
	// 편집모드에서 이동된 셀에 어떠한 작업을 할 것인가?
	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
	{
		let tmpTask = self.tasks[sourceIndexPath.row]
		self.tasks.remove(at: sourceIndexPath.row)
		self.tasks.insert(tmpTask, at: destinationIndexPath.row)
	}
}

extension ViewController: UITableViewDelegate
{
	// TableView에서 특정 Row가 선택되었을때의 Action
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		var task = self.tasks[indexPath.row]
		task.done.toggle()
		self.tasks[indexPath.row] = task
		self.tableView.reloadRows(at: [indexPath], with: .automatic)
	}
}
