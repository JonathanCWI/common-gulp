const expect = require('chai').expect;
const fs = require('fs');

describe('sass output', function() {
  const CSS_EXPECTED = 'body{background:#fff;color:red}\nmeta.foundation-version{font-family:"/5.4.7/"}'; // eslint-disable-line

  it('compiles css', function() {
    expect(fs.readFileSync('dist/test.css').toString()).to.equal(CSS_EXPECTED);
  });
});
