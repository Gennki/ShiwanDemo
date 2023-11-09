export interface AIOTMenuListResponse {
  list: Array<MenuListItem>
  pagination
}

export interface MenuListItem {
  id: string
  menuId: string
  menuName: string
  time: string // 烹饪时长，单位：s
  url: string
  videoUrl: string
  score: string // 评分
  goodsId: string // 商品id
  isCleanMenu: boolean // 是否是净菜
  goodsState: string // 净菜状态是否上架   0下架 1上架
  menuVersion: string
  paidMenu: string // 是否为付费菜谱，1：是  0或null：不是
}

export interface PageInfo {
  pageIndex: number
  pageSize: number
  totalSize: number
}

