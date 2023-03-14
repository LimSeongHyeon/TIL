//
//  ViewController.swift
//  04_Calculator
//
//  Created by Lim on 2023/03/13.
//

import UIKit

enum Operator {case add, sub, mul, div, unknown}

class ViewController: UIViewController
{

	@IBOutlet weak var resultOutputLabel: UILabel!
	
	
	var displayNumber = "" // 패드를 누를떄마다 표출되는 프로퍼티
	var firstOperand = "" // 첫번쨰 피연산자를 저장하는 프로퍼티
	var secondOperand = "" // 두번째 피연산자를 저장하는 프로퍼티
	var result = "" // 결과값을 저장하는 프로퍼티
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
			self.displayNumber += numberVal
			self.resultOutputLabel.text = self.displayNumber
		}
	}
	
	@IBAction func tapClearButton(_ sender: UIButton)
	{
		print(#function)
		self.displayNumber = ""
		self.firstOperand = ""
		self.secondOperand = ""
		self.result = ""
		self.currentOperator = .unknown
		self.resultOutputLabel.text = "0"
	}
	
	@IBAction func tapDotButton(_ sender: UIButton)
	{
		print(#function)
		if self.displayNumber.count < 8,
		   !self.displayNumber.contains(".")
		{
			self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
			self.resultOutputLabel.text = self.displayNumber
		}
	}
	
	@IBAction func tapAddButton(_ sender: UIButton)
	{
		print(#function)
		self.operation(.add)
	}
	
	@IBAction func tapSubButton(_ sender: UIButton)
	{
		print(#function)
		self.operation(.sub)
	}
	
	@IBAction func tapMulButton(_ sender: UIButton)
	{
		print(#function)
		self.operation(.mul)
	}
	
	@IBAction func tapDivButton(_ sender: UIButton)
	{
		print(#function)
		self.operation(.div)
	}
	
	@IBAction func tapEqualButton(_ sender: UIButton)
	{
		print(#function)
		self.operation(self.currentOperator)
	}
	
	func operation(_ operation: Operator)
	{
		print(#function)
		if self.currentOperator != .unknown
		{
			if !self.displayNumber.isEmpty
			{
				self.secondOperand = self.displayNumber
				self.displayNumber = ""
				
				
				guard let firstOperand = Double(self.firstOperand) else { return }
				guard let secondOperand = Double(self.secondOperand) else { return }
				
				switch self.currentOperator
				{
					case .add: self.result = "\(firstOperand + secondOperand)"
					case .sub: self.result = "\(firstOperand - secondOperand)"
					case .mul: self.result = "\(firstOperand * secondOperand)"
					case .div: self.result = "\(firstOperand / secondOperand)"
					case .unknown: break
				}
				
				if let result = Double(self.result),
				   result.truncatingRemainder(dividingBy: 1) == 0
				{
					self.result = "\(Int(result))"
				}
				
				self.firstOperand = self.result
				self.resultOutputLabel.text = self.result
			}
			self.currentOperator = operation
		}
		else
		{
			self.firstOperand = self.displayNumber
			self.currentOperator = operation
			self.displayNumber = ""
		}
	}
}

