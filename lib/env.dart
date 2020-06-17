class EnvConfig {
  static const env = 'uat';
  // Map dev;
  // if (env == 'test') {
  //   dev = {
  //     'api': 'http://192.168.10.186:31050/', // 测试环境
  //     'web-address': 'http://192.168.10.186:9000/',
  //     'wx-appid': 'wx902617a0eaaca56f'
  //   };
  // }

  static Map dev() {
    if (env == 'test') {
      return {
        'api': 'http://192.168.10.186:31050/', // 测试环境
        'web-address': 'http://192.168.10.186:9000/',
        // 'web-address': 'http://192.168.10.53:8080/',
        'qr-register-url': 'http://192.168.10.184:9015/',
        'wx-appid': 'wx902617a0eaaca56f'
      };
    } else if (env == 'uat') {
      return {
        'api': 'https://api-uat-37agent.woouo.com/', // 测试环境
        'web-address': 'https://h5-uat-37agent.woouo.com/',
        'qr-register-url': 'http://192.168.10.184:9015/',
        'wx-appid': 'wx902617a0eaaca56f'
      };
    } else {
      return {
        'api': 'http://192.168.10.181:31050/', // 开发环境
        'web-address': 'http://192.168.10.142:8080/',
        'qr-register-url': 'http://192.168.10.184:9015/',
        'wx-appid': 'wx902617a0eaaca56f'
      };
    }
  }
  
  // static Map dev = {
  //   // 'api': 'http://192.168.10.181:31050/', // 开发环境
  //   'api': 'http://192.168.10.186:31050/', // 测试环境
  //   // 'api': 'https://api-uat-37agent.woouo.com/', // uat环境
  //   'web-address': 'http://192.168.10.186:9000/',
  //   // 'web-address': 'https://h5-uat-37agent.woouo.com/',
  //   // 'web-address': 'http://192.168.10.60:8082/',
  //   // 'web-address': 'http://192.168.10.142:8080/',
  //   // 'web-address': 'https://h5-uat-37agent.woouo.com/',
  //   'wx-appid': 'wx902617a0eaaca56f'
  // };
}