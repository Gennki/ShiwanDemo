@Preview
@Component
export struct MainNavigationBar {
  @Link selectedIndex: number

  build() {
    Column() {
      TabItem({
        selectedIndex: this.selectedIndex,
        index: 0,
        selectedIcon: $r('app.media.ic_tab_one_selected'),
        unselectedIcon: $r('app.media.ic_tab_one_unselected')
      })
        .layoutWeight(60)
        .onClick(() => {
          this.selectedIndex = 0
        })

      TabItem({
        selectedIndex: this.selectedIndex,
        index: 1,
        selectedIcon: $r('app.media.ic_tab_two_selected'),
        unselectedIcon: $r('app.media.ic_tab_two_unselected')
      })
        .layoutWeight(60)
        .margin({ 'top': 10 })
        .onClick(() => {
          this.selectedIndex = 1
        })
      TabItem({
        selectedIndex: this.selectedIndex,
        index: 2,
        selectedIcon: $r('app.media.ic_tab_three_selected'),
        unselectedIcon: $r('app.media.ic_tab_three_unselected')
      })
        .layoutWeight(60)
        .margin({ 'top': 10 })
        .onClick(() => {
          this.selectedIndex = 2
        })
      TabItem({
        selectedIndex: this.selectedIndex,
        index: 3,
        selectedIcon: $r('app.media.ic_tab_four_selected'),
        unselectedIcon: $r('app.media.ic_tab_four_unselected')
      })
        .layoutWeight(174)
        .margin({ 'top': 10 })
        .onClick(() => {
          this.selectedIndex = 3
        })
    }
    .width(72)
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
struct TabItem {
  @Prop selectedIndex: number
  index: number = 0
  selectedIcon: Resource
  unselectedIcon: Resource

  isSelected(): boolean {
    return this.selectedIndex == this.index
  }

  build() {
    Row() {
      if (this.isSelected()) {
        Image(this.selectedIcon)
          .width(32)
          .height(32)
      } else {
        Image(this.unselectedIcon)
          .width(32)
          .height(32)
      }
    }
    .justifyContent(FlexAlign.Center)

    .width('100%')
    .height('100%')
    .linearGradient({
      colors: [[this.isSelected() ? 0xE8755E : 0xFFFFFF, 0.0], [this.isSelected() ? 0xFFA768 : 0xFFFFFF, 0.5]],
      angle: 90
    })
    .borderRadius(6)
  }
}