import cryptoFramework from '@ohos.security.cryptoFramework';

const charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

export function randomString(length: number): Promise<string> {
  let rd = cryptoFramework.createRandom()
  return rd.generateRandom(length)
    .then((value) => {
      let randStr = '';
      for (let i = 0; i < value.data.length; i++) {
        randStr += charset[value.data[i] % charset.length];
      }
      return randStr;
    })
}



