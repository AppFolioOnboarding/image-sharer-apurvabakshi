import React from 'react';
import { shallow } from 'enzyme/build';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Header from '../../components/Header';

describe('<Header />', () => {
  const wrapper = shallow(<Header />);

  it('should have a div', () => {
    expect(wrapper.find('div')).to.have.lengthOf(1);
  });

  it('should have a h3', () => {
    expect(wrapper.find('h3')).to.have.lengthOf(1);
  });

  it('is a Feedback page', () => {
    expect(wrapper.find('h3.text-center').contains('Tell us what you think'));
  });
});
