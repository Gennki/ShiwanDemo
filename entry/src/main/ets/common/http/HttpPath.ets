import { HttpConstant } from './HttpConstant'

export class HttpPath {
  static getMenuListByCatalogPath() {
    return `${HttpConstant.AIOT_BASE_URL}swan/open/ai/recommend/getHDCategoryRecommend/${HttpConstant.deviceId}/${HttpConstant.appCode}/${HttpConstant.appVersion}/${HttpConstant.channel}/${HttpConstant.deviceType}`
  }
}

