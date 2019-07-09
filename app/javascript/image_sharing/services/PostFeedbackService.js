import { post } from '../utils/helper';

export class PostFeedbackService {
  constructor(store, parameters) {
    this.store = store;
    this.parameters = parameters;
  }

  postFeedback = () => post('/api/feedbacks', this.parameters)
    .then(() => {
    //  alert('Feedback submitted!');
      this.store.clearData();
    })
    .catch(() => {
    //  alert('Something went wrong, please try again later');
    })
}

export default PostFeedbackService;
