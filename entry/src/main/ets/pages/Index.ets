import { Home } from '../views/main/Home'
import { MainNavigationBar } from '../views/main/MainNavigation'
import { Setting } from '../views/main/Setting'

@Entry
@Component
struct Index {
  @State selectedIndex: number = 0

  build() {
    Row() {
      MainNavigationBar({ selectedIndex: $selectedIndex })
        .width(72)
        .margin(8)
        .zIndex(2)

      this.buildContent()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background'))
  }

  @Builder
  buildContent() {
    if (this.selectedIndex === 0) {
      Home()
        .layoutWeight(1)
        .height('100%')
        .zIndex(1)
    } else if (this.selectedIndex === 1) {
      Home()
        .layoutWeight(1)
        .height('100%')
        .zIndex(1)
    } else if (this.selectedIndex === 2) {
      Home()
        .layoutWeight(1)
        .height('100%')
        .zIndex(1)
    } else {
      Setting()
        .layoutWeight(1)
        .height('100%')
        .zIndex(1)
    }
  }
}