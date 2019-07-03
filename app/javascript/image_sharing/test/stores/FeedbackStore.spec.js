import { expect } from 'chai';
import { describe, it } from 'mocha';
import { FeedbackStore } from '../../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('can set username', () => {
    const newstore = new FeedbackStore();
    newstore.setUsername('admin');
    expect(newstore.username).to.equal('admin');
  });

  it('can set feedback', () => {
    const newstore = new FeedbackStore();
    newstore.setFeedback('test');
    expect(newstore.feedback).to.equal('test');
  });

  it('can clear data', () => {
    const newstore = new FeedbackStore();
    newstore.setUsername('admin');
    newstore.setFeedback('test');
    newstore.clearData();
    expect(newstore.feedback).to.equal('');
    expect(newstore.username).to.equal('');
  });
});
