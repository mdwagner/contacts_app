import React, { PureComponent } from 'react';
import Hyperview from 'hyperview';
import Swipeable from 'react-native-swipeable';

export default class SwipeableRow extends PureComponent {
  static namespaceURI = 'https://hypermedia.systems/hyperview/swipeable';
  static localName = 'row';

  getElements = (tagName) => {
    return Array.from(this.props.element.getElementsByTagNameNS(SwipeableRow.namespaceURI, tagName));
  }

  getButtons = () => {
    return this.getElements('button').map((buttonElement) => {
      return Hyperview.renderChildren(buttonElement, this.props.stylesheets, this.props.onUpdate, this.props.options);
    });
  }

  render() {
    const [main] = this.getElements('main');

    if (!main) {
      return null;
    }

    const buttons = this.getButtons();
    const rightButtons = buttons.length ? buttons : null;

    return (
      <Swipeable rightButtons={rightButtons}>
        {Hyperview.renderChildren(main, this.props.stylesheets, this.props.onUpdate, this.props.options)}
      </Swipeable>
    );
  }
}
