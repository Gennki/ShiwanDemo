import { MenuListItem } from '../../beans/MenuListItem'

@Component
export struct MenuListItemWidget {
  @State isCardSelected: boolean = false
  menuListItem: MenuListItem

  build() {
    Stack() {
      Image(this.menuListItem.url)
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Column() {
        Text(this.menuListItem.menuName)
          .fontColor(Color.White)
          .fontSize(24)
          .fontWeight(FontWeight.Medium)

        Rating({
          rating: this.roundDownOrHalf(this.menuListItem.score),
          indicator: true
        })
          .stars(5)
          .starStyle({
            backgroundUri: "/images/ic_star_grey.png",
            foregroundUri: "/images/ic_star_light.png",
            secondaryUri: "/images/ic_star_half.png"
          })
          .margin({ top: 5 })
          .width(120)
          .height(20)

      }.alignItems(HorizontalAlign.Start)
      .padding({ left: 20, bottom: 10 })

    }
    .width(240)
    .height(240)
    .clip(true)
    .borderRadius(15)
    .alignContent(Alignment.BottomStart)
  }

  /**
   * 将数字字符串转换为整数或者以.5结尾的小数，例如："4.7"->4.5,"4.2"->4
   * @param input
   * @returns
   */
  roundDownOrHalf(input: string): number {
    let num = parseFloat(input)
    if (isNaN(num)) {
      throw new Error("输入的字符串不能转换为数字")
    }
    const decimal = num % 1
    if (decimal < 0.5) {
      num = Math.floor(num)
    } else {
      num = Math.floor(num) + 0.5
    }
    return num;
  }
}


@Preview({ title: "MenuListItemWidget" })
@Component
struct MenuListItemPreview {
  build() {
    MenuListItemWidget({
      isCardSelected: false,
      menuListItem: {
        id: "20211201154729_7b5ec0223ee7fa600667e2d1cdb3df04",
        menuId: "20211201154729_7b5ec0223ee7fa600667e2d1cdb3df04",
        menuName: "麻婆豆腐",
        time: "119",
        url: "https://tek-it-pub.oss-cn-shanghai.aliyuncs.com/upload/ecosystem/2023/03/21/2023032117010504e390c21787095f39e338b9a1aa8ada.jpg",
        videoUrl: "https://tek-it-pub.oss-cn-shanghai.aliyuncs.com/upload/ecosystem/2023/03/21/2023032117004127c7d4dbfe1166ac68e95f76782e2352.mp4",
        score: "4.7",
        goodsId: "14113594",
        isCleanMenu: false,
        goodsState: "0",
        menuVersion: "11.4",
        paidMenu: "0",
      }
    })
  }
}