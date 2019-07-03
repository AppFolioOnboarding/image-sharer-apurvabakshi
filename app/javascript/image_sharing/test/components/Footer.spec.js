import React from 'react';
import { shallow } from 'enzyme/build';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  const wrapper = shallow(<Footer />);

  it('should have a div', () => {
    expect(wrapper.find('div')).to.have.lengthOf(1);
  });

  it('should have a p', () => {
    expect(wrapper.find('p')).to.have.lengthOf(1);
  });

  it('says copyright of AppFolio', () => {
    expect(wrapper.find('p.text-center').contains('Copyright: Appfolio Inc. Onboarding'));
  });
});
