import http from '@ohos.net.http'
import promptAction from '@ohos.promptAction'
import { AppConstant } from '../constants/AppConstant'
import { md5 } from '../utils/MD5'
import { randomString } from '../utils/Random'
import { HttpPath } from './HttpPath'

export class HttpService {
  private static instance: HttpService;

  private constructor() {
  }

  static getInstance(): HttpService {
    if (!HttpService.instance) {
      HttpService.instance = new HttpService();
    }
    return HttpService.instance;
  }

  async getMenuListByCatalog(catalog: string, pageIndex: number, pageSize: number) {
    const url = HttpPath.getMenuListByCatalogPath();
    // const url = "http://192.168.31.24:8080/hello"
    const timestamp = Date.now();
    const nonce = await randomString(10)
    const token = "EA248A0456528EF358EF209050CF0D16";
    const extraData = {
      "level": catalog === "CLEAN_MENU" ? 1 : 2,
      "category": catalog,
      "pageIndex": pageIndex,
      "pageSize": pageSize,
      "userId": AppConstant.userId,
      "productType": AppConstant.productType,
      "requestId": await randomString(10),
      "status": AppConstant.isTest,
      "temperatureType": AppConstant.temperatureType.type
    };
    const sign = await getIOTSign(timestamp, nonce, token, extraData);

    const httpRequest = http.createHttp();
    httpRequest.request(url, {
      method: http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json',
        'timestamp': timestamp.toString(),
        'nonce': nonce,
        'sign': sign,
      },
      extraData: extraData
    }).then(value => {
      console.log(value.result.toString())
    }, reason => {
      console.log(reason)
    });
  }
}


function getIOTSign(timestamp: number, nonce: string, token: string, extraData: Object): Promise<string> {
  const paramsArrays: string[] = [];
  const keyArray = Object.keys(extraData).sort();
  for (const key of keyArray) {
    paramsArrays.push(`&${key}=${extraData[key]}`);
  }
  const paramsString = paramsArrays.join('').substring(1);
  const signParam = `${paramsString}&timestamp=${timestamp}&nonce=${nonce}&token=${token}`;
  return md5(signParam);
}

// --> POST https://aiot-tineco-life.tineco.com/swan/open/ai/recommend/getHDCategoryRecommend/211b4897a5806449a930561590a5f803/inset_android3/1.2.2.6/c_huawei/1?authAppkey=1538105560006&requestId=33502506d39e4e1f86cd2def5a5271ed&authTimeZone=Asia%2FShanghai&authTimespan=1698800867134&status=ENABLE&deviceId=211b4897a5806449a930561590a5f803&uid=20210427174255_0372ce8b56562fdbb84564c038deb39e&authSign=da5a088ee52a4a82716cd07013d74cdc&it=20211025130500 http/1.1
// Content-Type: application/json; charset=utf-8
// Content-Length: 209
// timestamp: 1698800867061
// nonce: 71glYT8V20
// sign: E2DA94FB2FC1EF4F1CE43CA03AE705E5
//
// {"level":2,"category":"SCREEN_1003","pageIndex":1,"pageSize":10,"userId":"20210427174255_0372ce8b56562fdbb84564c038deb39e","productType":"znccg3","requestId":"37d9VXSx5v","status":"ENABLE","temperatureType":2}
