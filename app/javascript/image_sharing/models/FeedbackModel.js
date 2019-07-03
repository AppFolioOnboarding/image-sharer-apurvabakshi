import { observable } from 'mobx';

export default class FeedbackModel {

  id = Math.random();
  @observable username;
  @observable feedback;

  constructor(username) {
    this.username = username;
  }
}
