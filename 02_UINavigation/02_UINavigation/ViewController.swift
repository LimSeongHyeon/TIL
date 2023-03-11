//
//  ViewController.swift
//  02_UINavigation
//
//  Created by Lim on 2023/03/09.
//

import UIKit

protocol SendDataDelegate: AnyObject
{
	func sendData(name: String)
}

class ViewController: UIViewController, SendDataDelegate
{

	@IBOutlet weak var nameLabel: UILabel!
	var name: String?
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		print(#function)
	}
	
	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)
		print(#function, name ?? "NONE")
	}
	
	override func viewDidAppear(_ animated: Bool)
	{
		super.viewDidAppear(animated)
		print(#function)
	}
	
	override func viewWillDisappear(_ animated: Bool)
	{
		super.viewWillDisappear(animated)
		print(#function)
	}

	override func viewDidDisappear(_ animated: Bool)
	{
		super.viewDidDisappear(animated)
		print(#function)
	}

	func sendData(name: String)
	{
		print("sendData : ", name)
		self.nameLabel.text = name
		self.nameLabel.sizeToFit()
	}
	
	@IBAction func tapCodePushButton(_ sender: UIButton)
	{
		// 1. ViewController를 Instance화 시킨다.
		// 이때 StoryBoard에서 해당되는 ViewController의 Identifier를 정의하고, instantiateViewController 메소드의 매개변수로 기입한다.
		// name Property의 접근을 위해 as로 Down casting 해준다.
		guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else { return }
		viewController.name = "Test Value for Code Push VC"
		
		// viewControlelr (CodePushVC)의 delegate의 자신을 할당하여 컨트롤 할 수 있게끔 전달.
		// Delegate 패턴
		viewController.delegate = self
		
		// 2. Instance화 된 View Controller를 pushViewController 메소드의 매개변수로 넣어주면 된다.
		self.navigationController?.pushViewController(viewController, animated: true)
	}
	
	@IBAction func tapCodePresentButton(_ sender: UIButton)
	{
		guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else { return }
		viewController.name = "Test Value for Code Present VC"
		viewController.delegate = self
		
		// 전체화면으로 전환한다.
		viewController.modalPresentationStyle = .fullScreen
		self.present(viewController, animated: true)
	}
	

	/*
	 3/10 - Destination Segue를 실행하기 직전에 실행
	 3/11 - 이 때 delegate를 넘겨주는 것이 아주 좋을 것 같다. Destination View Controller마다 어떻게 분기 시킬지에 대한 Refactoring이 필요함
	 */
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		// segue.destinate = 전환하려는 segue를 가져올 수 있다.
		if let viewController = segue.destination as? SeguePushViewController
		{
			viewController.name = "Test Value for SeguePushViewController"
			viewController.delegate = self
		}
		
		else if let viewController = segue.destination as? SeguePresentViewController
		{
			viewController.name = "Test Value for seguePresentViewController"
			viewController.delegate = self
		}
	}

}

