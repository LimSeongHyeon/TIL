//
//  CodePresentViewController.swift
//  02_UINavigation
//
//  Created by Lim on 2023/03/09.
//

import UIKit
class CodePresentViewController: UIViewController
{

	@IBOutlet weak var nameLabel: UILabel!
	var name : String?
	
	// 메모리 누수 방지를 위해 Delegate 사용 시에는 Weak 키워드 사용
	weak var delegate: SendDataDelegate?
	
	override func viewDidLoad()
	{
        super.viewDidLoad()
		if let name = name
		{
			self.nameLabel.text = name
			self.nameLabel.sizeToFit()
		}
    }
	
	override func viewWillDisappear(_ animated: Bool)
	{
		self.delegate?.sendData(name: #fileID)
	}
	
	@IBAction func tapBackButton(_ sender: UIButton)
	{
		self.dismiss(animated: true, completion: nil)
	}
	
	
}
