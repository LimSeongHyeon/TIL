	//
	//  RoundButton.swift
	//  04_Calculator
	//
	//  Created by Lim on 2023/03/13.
	//

import UIKit

// @IBDesignable -> 스토리보드에서 실시간으로 확인할 수 있음.
@IBDesignable
class RoundButton: UIButton
{
		// @IBInspetable -> 스토리보드에서 직접 설정값을 제어할 수 있음
	@IBInspectable var isRound: Bool = false
	{
		didSet
		{
			self.layer.cornerRadius = isRound ? self.frame.height / 2 : 0
		}
	}
}
