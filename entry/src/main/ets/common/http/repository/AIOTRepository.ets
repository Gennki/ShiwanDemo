import promptAction from '@ohos.promptAction';
import { AIOTMenuListResponse } from '../../../beans/MenuListItem';
import { AppConstant } from '../../constants/AppConstant';
import { md5 } from '../../utils/MD5';
import { randomString } from '../../utils/Random';
import { Http } from '../Http';
import { HttpPath } from '../HttpPath';
import { Response } from '../Response';

export class AIOTRepository {
  private static instance: AIOTRepository

  private AIOTRepository() {

  }

  static getInstance() {
    if (!AIOTRepository.instance) {
      AIOTRepository.instance = new AIOTRepository();
    }
    return AIOTRepository.instance;
  }


  /**
   * 首页列表分页
   * @param catalog
   * @param pageIndex
   * @param pageSize
   */
  async getMenuListByCatalog(catalog: string, pageIndex: number, pageSize: number) {
    const url = HttpPath.getMenuListByCatalogPath();
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
    const sign = (await this.getIOTSign(timestamp, nonce, token, extraData)).toUpperCase();
    const header = {
      'Content-Type': 'application/json',
      'timestamp': timestamp.toString(),
      'nonce': nonce,
      'sign': sign,
    }

    return Http.getInstance()
      .post(url, header, extraData)
      .then((value) => {
        const response = JSON.parse(value.result.toString()) as Response<AIOTMenuListResponse>
        if (response.code == 0) {
          return response.data
        } else {
          promptAction.showToast({ message: response.msg })
        }
      }).catch((reason) => {
        promptAction.showToast({ message: reason["message"] })
        return Promise.reject(reason)
      });
  }

  private getIOTSign(timestamp: number, nonce: string, token: string, extraData: Object): Promise<string> {
    const paramsArrays: string[] = [];
    const keyArray = Object.keys(extraData).sort();
    for (const key of keyArray) {
      paramsArrays.push(`&${key}=${extraData[key]}`);
    }
    const paramsString = paramsArrays.join('').substring(1);
    const signParam = `${paramsString}&timestamp=${timestamp}&nonce=${nonce}&token=${token}`;
    return md5(signParam);
  }
}
