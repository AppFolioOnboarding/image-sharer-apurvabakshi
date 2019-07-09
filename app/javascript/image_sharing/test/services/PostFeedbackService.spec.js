import 'jsdom-global/register';
import sinon from 'sinon';
import { describe, it, beforeEach, afterEach } from 'mocha';
import { PostFeedbackService } from '../../services/PostFeedbackService';
import * as api from '../../utils/helper';

describe('PostFeedbackService', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should call clearData', () => {
    const newStore = {
      clearData: sinon.spy(),
      alert: sinon.spy()
    };
    const data = Promise.resolve({ message: 'test' });
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(newStore, {});
    return service.postFeedback().then(() => {
      sinon.assert.calledOnce(newStore.clearData);
    });
  });

  it('should not call clearData', () => {
    const newStore = {
      clearData: sinon.spy(),
      alert: sinon.spy()
    };

    const data = Promise.reject(new Error('fail'));
    sandbox.stub(api, 'post').returns(data);

    const service = new PostFeedbackService(newStore, {});
    return service.postFeedback().then(() => {
      sinon.assert.notCalled(newStore.clearData);
    });
  });
});
