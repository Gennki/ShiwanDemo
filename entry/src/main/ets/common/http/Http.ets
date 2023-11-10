import http from '@ohos.net.http'
import hilog from '@ohos.hilog'
import { AppConstant } from '../constants/AppConstant'
import { md5 } from '../utils/MD5'
import { randomString } from '../utils/Random'
import { HttpPath } from './HttpPath'
import { Log } from '../utils/Log'
import { Response } from './Response'
import { AIOTMenuListResponse } from '../../beans/MenuListItem'
import url from '@ohos.url'

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
    Log.i(`url=>${url}`)
    Log.i(`header=>${JSON.stringify(header)}`)
    Log.i(`extraData=>${JSON.stringify(extraData)}`)
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
