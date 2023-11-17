import http from '@ohos.net.http'
import { Log } from '../utils/Log'

export class Http {
  private static instance: Http;

  private constructor() {
  }

  static getInstance(): Http {
    if (!Http.instance) {
      Http.instance = new Http();
    }
    return Http.instance;
  }

  post(url: string, header: Object, extraData: string | Object | ArrayBuffer) {
    const httpRequest = http.createHttp();
    return httpRequest.request(url, {
      method: http.RequestMethod.POST,
      header: header,
      extraData: extraData
    }).then((value) => {
      Log.i(value.result.toString())
      return value
    }).catch((reason) => {
      Log.i(reason["message"])
      return Promise.reject(reason)
    }).finally(() => {
      httpRequest.destroy()
    })
  }
}
