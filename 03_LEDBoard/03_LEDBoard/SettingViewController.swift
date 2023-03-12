//
//  SettingViewController.swift
//  03_LEDBoard
//
//  Created by Lim on 2023/03/12.
//

import UIKit

class SettingViewController: UIViewController
{
	@IBOutlet weak var grayButton: UIButton!
	@IBOutlet weak var whiteButton: UIButton!
	@IBOutlet weak var blackButton: UIButton!
	
	@IBOutlet weak var redButton: UIButton!
	@IBOutlet weak var blueButton: UIButton!
	@IBOutlet weak var yellowButton: UIButton!
	
	@IBOutlet weak var textField: UITextField!
	
	weak var delegate: LEDBoardSettingDelegate?
	
	var ledText: String?
	var textColor: UIColor = .yellow
	var backgroundColor: UIColor = .black
	
	override func viewDidLoad()
	{
		configureView()
        super.viewDidLoad()
    }
	
	// view의 초기 설정치에 대한 함수
	private func configureView()
	{
		textField.text = ledText
		changeTextColor(textColor)
		changeBackgroundColor(backgroundColor)
	}

	
	@IBAction func tapTextColorButton(_ sender: UIButton)
	{
		switch(sender)
		{
			case yellowButton: self.changeTextColor(.yellow)
			case blueButton: self.changeTextColor(.blue)
			case redButton: self.changeTextColor(.red)
			default: return
		}

	}
	
	
	@IBAction func tapBackgroundColorButton(_ sender: UIButton)
	{
		print(sender)
		switch(sender)
		{
			case blackButton: self.changeBackgroundColor(.black)
			case whiteButton: self.changeBackgroundColor(.white)
			case grayButton: self.changeBackgroundColor(.gray)
			default: return
		}
	}
	
	@IBAction func tapSaveButton(_ sender: Any)
	{
		self.delegate?.changedSetting(text: textField.text, textColor: textColor, backgroundColor: backgroundColor)
		self.navigationController?.popViewController(animated: true)
	}
	
	// 선택된 버튼 이외의 색상 투명도로 0.5로 조정
	private func changeTextColor(_ color: UIColor)
	{
		self.yellowButton.alpha = (color == UIColor.yellow ? 1 : 0.5)
		self.blueButton.alpha = (color == UIColor.blue ? 1 : 0.5)
		self.redButton.alpha = (color == UIColor.red ? 1 : 0.5)
		
		self.textColor = color
	}
	
	// 선택된 버튼 이외의 색상 투명도로 0.5로 조정
	private func changeBackgroundColor(_ color: UIColor)
	{
		self.blackButton.alpha = (color == UIColor.black ? 1 : 0.5)
		self.whiteButton.alpha = (color == UIColor.white ? 1 : 0.5)
		self.grayButton.alpha = (color == UIColor.gray ? 1 : 0.5)
		
		self.backgroundColor = color
	}
	
}
