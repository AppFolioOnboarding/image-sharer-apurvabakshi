import React, { Component } from 'react';
import { action } from 'mobx';
import { observer } from 'mobx-react';
import { Form, FormGroup, Label, Input, Button } from 'reactstrap';
import PostService from '../services/PostFeedbackService';


@observer
class FeedbackForm extends Component {
  static propTypes = {
  };

  render() {
    return (
      <Form>
        <FormGroup>
          <Label for='username'>Enter your name:</Label>
          <Input className='usernameip' type='text' onChange={this.handleUnameInput} value={this.props.store.username} />
        </FormGroup>
        <FormGroup>
          <Label for='feedback'>Feedback:</Label>
          <Input className='feedbackip' type='textarea' onChange={this.handleFeedbackInput} value={this.props.store.feedback} />
        </FormGroup>
        <Button className='submit' onClick={this.submitFeedback}>Submit Feedback</Button>
      </Form>
    );
  }
  @action
  handleUnameInput = (e) => {
    this.props.store.setUsername(e.currentTarget.value);
  }

  @action
  handleFeedbackInput = (e) => {
    this.props.store.setFeedback(e.currentTarget.value);
  }

  @action
  submitFeedback = () => {
    const parameters = {
      name: this.props.store.username,
      comments: this.props.store.feedback
    };
    const service = new PostService(this.props.store, parameters);
    return service.postFeedback();
  }
}

export default FeedbackForm;
