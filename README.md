
#  Earth Debugger

<img src="/res/app_icon.png" width="256px"/>

🎉 **WWDC 2023 [Swift Student Challenge](https://developer.apple.com/wwdc23/swift-student-challenge/) Accepted**

Earth Debugger는 코딩을 처음 시작하는 사람들이 코딩을 쉽고, 중요한 문제를 해결할 수 있는 도구로서 받아들일 수 있도록 아픈 지구를 코딩으로 깨끗하게 치료하자는 목표를 가지고 있습니다.

Earth Debugger was born out of the idea of curing a sick planet with coding. The goal is to get people who are new to coding to embrace coding as a tool that is easy and can solve important problems.

1. [Specs](#specs)
2. [Details](#details)
    - [Earth Status](#earth-status)
    - [Code](#code)
    - [Result](#result)
3. [Credit](#credit)
4. [License](#license)
  
## Specs

<a href="https://developer.apple.com/kr/swift/"><img src="https://img.shields.io/badge/Swift-FA7343?style=flat&logo=Swift&logoColor=white"/></a>
<a href="https://developer.apple.com/kr/xcode/swiftui/"><img src="https://img.shields.io/badge/SwiftUI-0D96F6?style=flat&logo=Swift&logoColor=black"/></a>
<a href="https://developer.apple.com/kr/xcode/"><img src="https://img.shields.io/badge/Xcode-147EFB?style=flat&logo=Xcode&logoColor=white"/></a>

- Xcode 14.3 App Playground
- iPadOS Playground not tested
- Runnable: Mac(Mac Catalyst), iPad(iPadOS 16), iOS(iOS 16, some UI may not functional)

## Details

<img src="/res/opening.gif"/>
https://youtu.be/prc4jeNdFfA

### Earth Status

<img src="/res/status.png" width="256px"/>

지구는 `water`, `air`, `soil`, `ocean`, `deforestation`의 다섯 가지 `Pollution Factor`와 `motivated`, `energy`의 `Sustainable Factor`를 가지고 있습니다.

궁극의 목표는 모든 `Pollution Factor`의 수치를 10% 미만으로 만들어 지구의 환경을 깨끗하게 만드는 것이며, 이는 준비된 몇 가지의 명령어를 배치하고 실행함으로써 수행할 수 있습니다.

Earth has five `Pollution Factors` - `water`, `air`, `soil`, `ocean`, `deforestation`, and two `Sustainable Factors` - `motivated`, `energy`.

The goal is to get all the `Pollution Factor` values below 10% to clean up the planet, and this can be done by placing and executing a few prepared commands.

<img src="/res/code_add.gif"/>

### Code

<img src="/res/code_sample.png" width="360px"/>

모든 코드가 항상 긍정적인 영향을 끼치고, 제약 없이 실행 가능한 것은 아닙니다.

예를 들어, 소고기는 생산하기 위해 많은 양의 온실가스가 발생하고, 목초지를 짓기 위해 산림이 파괴되지만, 이를 제한한다면 사람들은 환경 문제에 덜 관심을 가지게 될 것입니다. 

예시로 보여지는 `reduceBeef()`는 `air pollution`, `soil pollution`, `deforestation` 수치를 낮추지만, 이를 실행하기 위해서는 `motivated` 수치가 충분해야 합니다.

이러한 요소들을 고려하여 지속 가능한 환경 문제 솔루션을 만들어 내는 것이 좋습니다.

Not all code will always have a positive impact, and not all code can be executed without constraints.

For example, beef produces a lot of greenhouse gases before it is consumed, and forests are destroyed to build pastures, but if we restricted it, people would care less about environmental issues. 

The example `reduceBeef()` will reduce the `air pollution`, `soil pollution`, and `deforestation` values, but requires a sufficient `motivated` value to execute.

It's important to place code blocks with these sustainability factors in mind.

### Result

<div>
<img src="/res/earth_healthy.png" width="360px"/>
<img src="/res/code_fail.png" width="360px"/>
</div>

전략이 완성되었다면 `Run` 버튼을 눌러 이를 실행할 수 있습니다.

실행이 완료되면 지구가 깨끗해졌는지 확인할 수 있고, 코드가 성공적으로 실행되었는지 여부와 해당 코드가 끼친 영향, 그리고 만약 실행되지 않았다면 그 이유를 확인할 수 있습니다.

예상과 다르게 실행되었다면 결과창을 보고 수정한 이후 다시 시도해볼 수도 있습니다.

Once your strategy is complete, you can run it by pressing the `Run` button.

After running, you can see if the planet is clean, if the code ran successfully, and what impact it had. If it failed, you'll also be able to check why.

If the result is not what you expected, you can fix it and try again.

<img src="/res/debugging.gif"/>

## Credit
- Earth Picture: from [Wikipedia](https://ko.wikipedia.org/wiki/위성_사진)
- Material Icons: from [Material Design](https://fonts.google.com/icons)
- SF Symbols: from [Apple](https://developer.apple.com/design/resources/)

## License
[License](https://github.com/mgdgc/earth-debugger/blob/main/LICENSE)


