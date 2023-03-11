//
//  SeguePresentViewController.swift
//  02_UINavigation
//
//  Created by Lim on 2023/03/09.
//

import UIKit

class SeguePresentViewController: UIViewController
{
	@IBOutlet weak var nameLabel: UILabel!
	
	var name: String?
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
		self.presentingViewController?.dismiss(animated: true, completion: nil)
	}
	
	
	
}
