import React, { PureComponent, Fragment, createRef } from 'react';
import Hyperview, { Events } from 'hyperview';
import Swipeable from 'react-native-gesture-handler/Swipeable';

export default class SwipeableRow extends PureComponent {
  static namespaceURI = 'https://hypermedia.systems/hyperview/swipeable';
  static localName = 'row';

  swipeableRef = createRef();

  eventCallback = (eventName) => {
    if (this.swipeableRef.current != null) {
      if (eventName == 'swipeable-close') {
        this.swipeableRef.current.close();
      }
    }
  };

  componentDidMount() {
    Events.subscribe(this.eventCallback);
  }

  componentWillUnmount() {
    Events.unsubscribe(this.eventCallback);
  }

  getElements = (tagName) => {
    return Array.from(this.props.element.getElementsByTagNameNS(SwipeableRow.namespaceURI, tagName));
  }

  getButtons = () => {
    return this.getElements('button').map((buttonElement) => {
      return Hyperview.renderChildren(buttonElement, this.props.stylesheets, this.props.onUpdate, this.props.options);
    });
  }

  // Swipeable renders actions in reverse, so we just revert that
  renderRightActions = () => {
    return (
      <Fragment>
        {this.getButtons().reverse()}
      </Fragment>
    );
  }

  render() {
    const [main] = this.getElements('main');
    if (!main) {
      return null;
    }

    return (
      <Swipeable ref={this.swipeableRef} renderRightActions={this.renderRightActions}>
        {Hyperview.renderChildren(main, this.props.stylesheets, this.props.onUpdate, this.props.options)}
      </Swipeable>
    );
  }
}
