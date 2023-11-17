import { MenuListItem } from '../../beans/MenuListItem'
import { homeViewModel } from '../../HomeViewModel'
import { MenuListItemWidget } from './MenuListItemWidget'

@Component
export struct MenuListWidget {
  classifyIndex: number
  @State menuList: MenuListItem[] = []

  // 分页查询，默认从第1页开始，每一页大小为10
  pageIndex = 1
  pageSize = 10

  aboutToAppear() {
    if (this.classifyIndex < 4) {
      const classifyCode = homeViewModel.classification[this.classifyIndex].code
      homeViewModel.getMenuList(classifyCode, this.pageIndex, this.pageSize)
        .then((value => {
          this.menuList = value;
        }))
    }
  }

  build() {
    List({ space: 15 }) {
      ForEach(this.menuList, (item) => {
        ListItem() {
          MenuListItemWidget({ isCardSelected: true, menuListItem: item })
        }
      }, (item) => item.id)

      ListItem() { // 加载更多
        LoadMore()
      }
    }
    .listDirection(Axis.Horizontal)
    .alignListItem(ListItemAlign.Center)
    .padding({ left: 20 })
    .width('100%')
    .height('100%')
  }
}

@Component
struct LoadMore {
  isLoadMore: boolean

  constructor(isLoadMore: boolean) {
    super()
    this.isLoadMore = isLoadMore;
  }

  build() {
    Column() {
      LoadingProgress()
        .width(40)
        .height(40)
      Text('正\n在\n加\n载')
        .fontColor($r('app.color.font_grey'))
        .fontSize(14)
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width(50)
    .visibility(this.isLoadMore ? Visibility.Visible : Visibility.None)
  }
}


@Preview({ title: "MenuListWidget", width: 1280, height: 300, dpi: 160 })
@Component
struct MenuListWidgetPreview {
  build() {
    MenuListWidget({
      classifyIndex: 0,
      menuList: [{
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
      },
        {
          id: "20211129163342_5f2b8687cddab64ef12cb28b1fb02a51",
          menuId: "20211129163342_5f2b8687cddab64ef12cb28b1fb02a51",
          menuName: "青椒土豆丝",
          time: "270",
          url: "https://tek-it-pub.oss-cn-shanghai.aliyuncs.com/upload/ecosystem/2022/12/31/2022123113101939540d1b74df4acc021e85193b83a136.jpg",
          videoUrl: "https://tek-it-pub.oss-cn-shanghai.aliyuncs.com/upload/ecosystem/2022/03/08/20220308101446e8d467cc4d48730b3185b3abe6a4e4a7.mp4",
          score: "4.7",
          goodsId: null,
          isCleanMenu: false,
          goodsState: null,
          menuVersion: "2.1",
          paidMenu: "0"
        },
      ]
    }

    )
  }
}