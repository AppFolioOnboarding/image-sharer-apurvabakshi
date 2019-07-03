import { observable, computed, action } from 'mobx';

import FeedbackModel from './FeedbackModel';

export default class FeedbackList {
  @observable feedbacks = [];

  @computed
  get feedbacksCount() {
    // return this.feedbacks.filter(feedback => !feedback.finished).length;
  }

  @action
  addFeedback(username) {
    this.feedbacks.push(new FeedbackModel(username));
  }
}
