//
//  ViewController.swift
//  04_Calculator
//
//  Created by Lim on 2023/03/13.
//

import UIKit

enum Operator: String
{
	case add = "+"
	case sub = "-"
	case mul = "×"
	case div = "÷"
	case unknown = "?"
	
}

class ViewController: UIViewController
{

	@IBOutlet weak var resultOutputLabel: UILabel!
	@IBOutlet weak var processOutputLabel: UILabel!
	
	var displayNumber = "0" // 패드를 누를떄마다 표출되는 프로퍼티
	{
		didSet
		{
			self.resultOutputLabel.text = self.displayNumber
		}

	}
	var firstOperand = "0" // 첫번쨰 피연산자를 저장하는 프로퍼티
	var secondOperand = "0" // 두번째 피연산자를 저장하는 프로퍼티

	var currentOperator: Operator = .unknown // 새롭게 입력된 연산자를 Operand 연결체로써 저장하는 프로퍼티
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
	}

	
	@IBAction func tapNumberButton(_ sender: UIButton)
	{
		print(#function)
		guard let numberVal = sender.titleLabel?.text else { return }
		if self.displayNumber.count < 9
		{
			self.displayNumber = self.displayNumber != "0" ? displayNumber + numberVal : numberVal
		}
	}
	
	@IBAction func tapClearButton(_ sender: UIButton)
	{
		print("\n\n[CLEAR]")
		print(#function)
		self.displayNumber = "0"
		self.firstOperand = "0"
		self.secondOperand = "0"
		self.currentOperator = .unknown
		self.resultOutputLabel.text = "0"
		self.processOutputLabel.text = ""
	}
	
	@IBAction func tapDotButton(_ sender: UIButton)
	{
		print(#function)
		if self.displayNumber.count < 8,
		   !self.displayNumber.contains(".")
		{
			self.displayNumber += "."
		}
	}
	
	
	@IBAction func tapOperatorButton(_ sender: UIButton)
	{
		print(#function)
		if let operation = sender.accessibilityLabel
		{
			let prevOperator = self.currentOperator
			
			switch operation
			{
				case "add": self.currentOperator = .add
				case "sub": self.currentOperator = .sub
				case "mul": self.currentOperator = .mul
				case "div": self.currentOperator = .div
				default: self.currentOperator = .unknown
			}
			
			// 이전에 이미 연산자가 있는 경우에는 해당 연산만 교체하기 위함
			// * 새롭게 Operator가 할당되는 경우에만 진행
			if prevOperator == .unknown
			{
				self.firstOperand = self.displayNumber
				self.displayNumber = "0"
			}
			self.processOutputLabel.text = "\(firstOperand) \(self.currentOperator.rawValue)"
		}
	}
	
	@IBAction func tapEqualButton(_ sender: UIButton)
	{
		print(#function)
		if self.currentOperator != .unknown
		{
			self.secondOperand = self.displayNumber
			self.processOutputLabel.text = "\(firstOperand) \(self.currentOperator.rawValue) \(secondOperand)"
			
			self.operation()
			self.currentOperator = .unknown
			self.secondOperand = "0"
			
				// result의 값이 Int로 표현가능 하다면 Int형태의 String으로 저장한다.
			if let result = Double(self.displayNumber)
			{
				self.displayNumber = result.truncatingRemainder(dividingBy: 1) == 0 ? "\(Int(result))" : "\(result)"
			}
		}
	}
	
	
	func operation()
	{
		guard let firstOperand = Double(self.firstOperand) else { return }
		guard let secondOperand = Double(self.secondOperand) else { return }
		
		switch self.currentOperator
		{
			case .add: self.displayNumber = "\(firstOperand + secondOperand)"
			case .sub: self.displayNumber = "\(firstOperand - secondOperand)"
			case .mul: self.displayNumber = "\(firstOperand * secondOperand)"
			case .div: self.displayNumber = "\(firstOperand / secondOperand)"
			case .unknown: break
		}
	}
}

