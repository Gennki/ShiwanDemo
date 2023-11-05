import { HttpConstant } from './HttpConstant'

export class HttpPath {
  static getMenuListByCatalogPath() {
    return `${HttpConstant.AIOT_BASE_URL}swan/open/ai/recommend/getHDCategoryRecommend/${HttpConstant.deviceId}/${HttpConstant.appCode}/${HttpConstant.appVersion}/${HttpConstant.channel}/${HttpConstant.deviceType}`
  }
}

// ?authAppkey=1538105560006&requestId=b812a374f23c4e58ae2e25ad2552e2a5&authTimeZone=Asia%2FShanghai&authTimespan=1698650966395&status=ENABLE&deviceId=1057e5c54a3548e92372efc1718806dc&uid=20210524114449_b630cf933d788002456f88234fbb3d50&authSign=48ca23f28545268359c45e1dac2a9ee6&it=20211025130500 http/1.1
