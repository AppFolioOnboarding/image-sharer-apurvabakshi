import { observable, action } from 'mobx';

export class FeedbackStore {
  @observable username;
  @observable feedback;

  constructor() {
    this.username = '';
    this.feedback = '';
  }

  @action
  setUsername(username) {
    this.username = username;
  }

  @action
  setFeedback(feedback) {
    this.feedback = feedback;
  }

  @action
  clearData() {
    this.feedback = '';
    this.username = '';
  }
}

export default FeedbackStore;
