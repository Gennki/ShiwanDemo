import cryptoFramework from '@ohos.security.cryptoFramework'


export function md5(str: string): Promise<string> {
  let md = cryptoFramework.createMd("MD5")
  return md.update(generateDataBlob(str))
    .then(() => {
      return md.digest()
    }).then((value) => {
      return uint8ArrayToHex(value.data);
    })
}

function stringToUint8Array(str: string) {
  let arr = [];
  for (let index = 0; index < str.length; index++) {
    arr.push(str.charCodeAt(index))
  }
  return new Uint8Array(arr)
}

function uint8ArrayToHex(arr: Uint8Array): string {
  return Array.from(arr, function (byte) {
    return ('0' + (byte & 0xFF).toString(16)).slice(-2);
  }).join('');
}

function generateDataBlob(str: string) {
  let dataBlob = { data: stringToUint8Array(str) }
  return dataBlob
}

