import hilog from '@ohos.hilog'

export class Log {
  private static domain: number = 0x00
  private static tag: string = "HttpLog"
  private static maxLogLength = 800;

  private constructor() {
  }

  static e(content: string, {domain = Log.domain, tag = Log.tag }: {
    domain?: number,
    tag?: string
  } = {}) {
    for (let i = 0; i < content.length; i += Log.maxLogLength) {
      const end = Math.min(i + Log.maxLogLength, content.length);
      const part = content.substring(i, end);
      hilog.error(domain, tag, part)
    }
  }


  static i(content: string, {domain = Log.domain, tag = Log.tag }: {
    domain?: number,
    tag?: string
  } = {}) {
    if (!domain) {
      domain = Log.domain
    }
    if (!tag) {
      tag = Log.tag
    }
    for (let i = 0; i < content.length; i += Log.maxLogLength) {
      const end = Math.min(i + Log.maxLogLength, content.length);
      const part = content.substring(i, end);
      hilog.info(domain, tag, part)
    }
  }


  static w(content: string, {domain = Log.domain, tag = Log.tag }: {
    domain?: number,
    tag?: string
  } = {}) {
    if (!domain) {
      domain = Log.domain
    }
    if (!tag) {
      tag = Log.tag
    }
    for (let i = 0; i < content.length; i += Log.maxLogLength) {
      const end = Math.min(i + Log.maxLogLength, content.length);
      const part = content.substring(i, end);
      hilog.warn(domain, tag, part)
    }
  }


  static d(content: string, {domain = Log.domain, tag = Log.tag }: {
    domain?: number,
    tag?: string
  } = {}) {
    if (!domain) {
      domain = Log.domain
    }
    if (!tag) {
      tag = Log.tag
    }
    for (let i = 0; i < content.length; i += Log.maxLogLength) {
      const end = Math.min(i + Log.maxLogLength, content.length);
      const part = content.substring(i, end);
      hilog.debug(domain, tag, part)
    }
  }
}