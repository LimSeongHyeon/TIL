//
//  ViewController.swift
//  03_LEDBoard
//
//  Created by Lim on 2023/03/12.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject
{
	func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class ViewController: UIViewController, LEDBoardSettingDelegate
{
	@IBOutlet weak var contentsLabel: UILabel!
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		self.contentsLabel.textColor = .yellow
	}
	
	// RootViewController -> DestinationViewController로 이동 준비 단계에서 일어나는 작업
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		if let settingViewController = segue.destination as? SettingViewController
		{
			settingViewController.delegate = self
			settingViewController.ledText = contentsLabel.text
			settingViewController.textColor = self.contentsLabel.textColor
			if let backgroundColor = self.view.backgroundColor
			{
				settingViewController.backgroundColor = backgroundColor
			}
			
		}
	}

	func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
	{
		self.contentsLabel.text = text ?? ""
		self.view.backgroundColor = backgroundColor
		self.contentsLabel.textColor = textColor
	}
}

