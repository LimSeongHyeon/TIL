## Storyboard를 이용한 명언 생성기



### 서론

SwiftUI를 통해서 iOS 개발에 입문한 나로서는 UIKit을 사용하는 것이 매우 생소하다. 하지만 아직 많은 앱이 SwiftUI로 전환되지 않아 상당 부분 UIKit으로 되어있는 부분도 많다고 하고, SwiftUI도 UIKit을 통해 탄생했기에 간혹 UIKit의 내용을 빌려 설명할 때 이해가 잘 안 가곤 했다.

이번 기회에 UIKit / Storyboard 방식을 공부해서 알고 있던 SwiftUI 경험과 함께 확장시킬 생각이다.

<hr>

### 간단한 소개



<img src='https://github.com/LimSeongHyeon/TIL/blob/main/Image/01_Storyboard.gif'>



- 2023.03.07

​		정적으로 선언되어 있는 명언의 리스트를 가지고 있고, Next 버튼을 탭할 시에 `UILabel`에 랜덤하게 보여주는 `IBAction`을 갖는다.

<hr>

### Storyboard 형식의 개발은 MFC 개발과 많이 닮아있다고 느꼈다.

MFC에서 멤버 변수를 만들듯이 UIKit에서는 `@IBOutlet`을 통해서 UI와 변수를 링크 시킨다. 또한 멤버 함수를 만들듯이 `IBAction`을 이용하여 해당 Action Element의 Event를 정의한다. 또한, MFC의 `OnDraw`처럼 원시 데이터에 대한 UI 출력 동작이 `viewDidLoad`의 형태로 존재한다.





### AutoLayout

UIComponent를 이용해서 UIView를 구성할 때, 해상도가 서로 다른 기기 간의 개발자 / 디자이너가 의도한 UI와는 다르게 보일 우려가 있다. AutoLayout은 이러한 UIView에 Constraints를 적용하여 화면 크기가 서로 다른 기기 간에도 의도한 대로 UI가 구성될 수 있게 도와준다.

제약조건(Constraints)은 View와 View 사이에 간격이나, Margin, 혹은 고정된 넓이나 높이와 같은 조건들이 있다.





### Content Hugging Priority & Content Compression Resistance Priority

`Label`이나 `ImageView`와 같이 크기를 정할 수 없는 UIView들이 존재한다 (글자 수 제한이 없거나, 이미지의 크기 제한이 없는 경우). 이때, 본인의 사이즈를 유지하려고 하거나, 줄이려고 하는 우선순위를 설정할 수 있게 된다.



Content Hugging Priority는 View가 Content를 얼마나 껴안을지에 대한 우선순위이다.

- `UILabel`에 텍스트가 너무 길어서 `UILabel`이 커져야 하는데 다른 `UIView`가 이를 방해하고 있다고 가정해 보자. 
    1. UILabel이 방해하는 UIView보다 Content Hugging Priority 값이 더 크다면, UILabel이 UIView보다 더 꽉 껴안기 때문에 UILabel은 UIView에 맞추어 Content가 다 보이지 않더라도 작은 사이즈를 유지하려고 한다.
    2. UILabel이 방해하는 UIView보다 Content Hugging Priority 값이 더 작다면, UIView가 UILabel보다 더 꽉 껴안기 때문에 UIView가 UILabel에 맞추어 Content가 다 보이지 않더라도 작은 사이즈를 유지하려고 할 것이다.



Content Compression Resistance Priority는 View가 자신의 Content를 얼마나 압축하기 싫은지에 대한 우선순위이다.

- `ImageView`에 이미지가 너무 커서 `ImageView`가 커져야 하는데 다른 `UIView`가 이를 방해하고 있다고 가정해 보자.
    1. ImageView가 방해하는 UIView보다 Content Compression Resistance Priority 값이 더 크다면, ImageView는 UIView보다 압축하기 싫어하기에 Image는 원본을 유지하고 UIView가 압축될 것이다.
    2. ImageView가 방해하는 UIView보다 Content Compression Resistance Priority 값이 더 작다면, UIView가 ImageView보다 압축하기 싫어하기에 Image는 원본을 유지하지 못하고 ImageView가 압축될 것이다.

<hr>

### 알아볼 점

- Strong / Weak 객체에 대해서

- Sender 방식에 대해서



