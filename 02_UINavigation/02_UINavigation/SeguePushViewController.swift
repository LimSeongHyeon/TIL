//
//  SeguePushViewController.swift
//  02_UINavigation
//
//  Created by Lim on 2023/03/09.
//

import UIKit

class SeguePushViewController: UIViewController
{
	@IBOutlet weak var nameLabel: UILabel!
	var name : String?
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

	/*
	 3/11 - @IBAction을 통한 tapBackButton에 이전 뷰에 대한 delegate작업 시 Navigation Bar에 존재하는 Back Button이나, 왼쪽 스와이프를 통한 뒤로가기 작업에 대해서는 해당 작업이 발생하지 않기에 viewWillDisappear에서 delegate를 이용한 값 전달 작업을 해주는게 더 바람직해보인다.
	 */
	@IBAction func tapBackButton(_ sender: UIButton)
	{
		self.navigationController?.popViewController(animated: true)
		// self.navigationController?.popToRootViewController(animated: true)
	}
	
	/*
	 3/11 - @IBAction을 통한 tapBackButton에 delegate작업 시 Navigation Bar에 존재하는 Back Button이나, 왼쪽 스와이프를 통한 뒤로가기 작업에 대해서 해당 작업이 발생하지 않기에 viewWillDisappear에서 작업해주는게 더 바람직해보인다.
	 */
	override func viewWillDisappear(_ animated: Bool)
	{
		self.delegate?.sendData(name: #fileID)
	}

}
