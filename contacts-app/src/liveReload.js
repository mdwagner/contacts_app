import { DevSettings } from 'react-native';
import { IP_ADDRESS } from './constants';

export default {
  action: 'live-reload',
  callback: (element) => {
    if (__DEV__) {
      const NAMESPACE_URI = 'http://dev.localhost/live-reload';
      const port = element.getAttributeNS(NAMESPACE_URI, 'port') || '3001';
      const uri = `ws://${IP_ADDRESS}:${port}`;
      new WebSocket(uri).onmessage = () => {
        setTimeout(() => DevSettings.reload(), 1000);
      };
    }
  },
};
