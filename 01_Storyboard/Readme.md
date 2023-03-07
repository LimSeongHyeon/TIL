## Storyboard를 이용한 명언 생성기



### 서론

SwiftUI를 통해서 iOS개발에 입문한 나로써는 UIKit을 사용하는것이 매우 생소하다. 하지만 아직 많은 앱이 SwiftUI로 전환되지 않아 상당부분 UIKit으로 되어있는 부분도 많다고 하고, SwiftUI도 UIKit을 통해 탄생했기에 간혹 UIKit의 내용을 빌려 설명할때 이해가 잘 안가곤 했다.

이번 기회에 UIKit / Storyboard방식을 공부해서 알고있던 SwiftUI 경험과 함께 확장시킬 생각이다.

<hr>

### 간단한 소개

<img src='https://github.com/LimSeongHyeon/TIL/blob/main/Image/01_Storyboard.gif'>



- 2023.03.07

​		정적으로 선언되어있는 명언의 리스트를 가지고 있고, Next 버튼을 탭할 시에 `UILabel`에 랜덤하게 보여주는 `IBAction`을 갖는다.

<hr>

### 배운점

>  Storyboard형식의 개발은 MFC 개발과 많이 닮아있다고 느꼈다.

MFC에서 맴버 변수를 만들듯이 UIKit에서는 `@IBOutlet`을 통해서 UI와 변수를 링크 시킨다. 또한 멤버 함수를 만들듯이 `IBAction`을 이용하여 해당 Action Element의 Event를 정의한다. 또한, MFC의 `OnDraw`처럼 원시 데이터에 대한 UI출력 동작이 `viewDidLoad`의 형태로 존재한다.



<hr>

### 알아볼 점

- Strong / Weak 객체에 대해서

- Sender 방식에 대해서



