//
//  ViewController.swift
//  01_Storyboard
//
//  Created by Lim on 2023/03/07.
//

import UIKit

class ViewController: UIViewController
{
	var currentQuote = Quote(contents: "", name: "")
	
	@IBOutlet weak var quoteView: UIView!
	
	@IBOutlet weak var quoteTitleLabel: UILabel!
	@IBOutlet weak var quoteWriterLabel: UILabel!
	
	let quotes : [Quote] = [
		.init(contents: "순간들을 소중히 여기다 보면, 긴 세월은 저절로 흘러간다.", name: "마리아 에지워스"),
		.init(contents: "과거의 사건들은 크게, 십중팔구 아예 일어나지 않았던 일과 중요하지 않은 일로 나눌 수 있을 것이다.", name: "윌리엄 랄프 인지"),
		.init(contents: "준비 여부에 관계 없이, 열망을 실현하기 위한 명확한 계획을 세우고 즉시 착수하여 그 계획을 실행에 옮겨라.", name: "나폴레온 힐"),
		.init(contents: "오늘 누군가가 그늘에 앉아 쉴 수 있는 이유는 오래 전에 누군가가 나무를 심었기 때문이다.", name: "워런 버핏"),
		.init(contents: "명확히 설정된 목표가 없으면, 우리는 사소한 일상을 충실히 살다 결국 그 일상의 노예가 되고 만다.", name: "로버트 하인라인"),
		.init(contents: "사업의 성공은 훈련과 절도, 고된 노력을 요한다. 그러나 이런 것들에 지레 겁먹지만 않으면 성공의 기회는 오늘도 그 어느 때 못지 않다.", name: "데이비드 록펠러"),
	]
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		self.changeQuoteRandomly()
	}
	
	
	@IBAction func tabChangeColorButton(_ sender: UIButton)
	{
		self.changeQuoteRandomly()
	}
	
	func changeQuoteRandomly()
	{
		let random = Int(arc4random_uniform(UInt32(self.quotes.count)))
		self.currentQuote = quotes[random]
		self.quoteTitleLabel.text = self.currentQuote.contents
		self.quoteWriterLabel.text = self.currentQuote.name
	}
}

