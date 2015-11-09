require 'spec_helper'

describe Wrapomatic do
  let(:dummy) {Object.new}
  let(:text) {"This is some text to wrap. It is intentionally long and contains a few newlines\nto ensure that all of the features of the wrapper\nwork\nas\nexpected."}

  it 'has a version number' do
    expect(Wrapomatic::VERSION).not_to be nil
  end

  describe '.wrap' do
    it 'uses a new instance to wrap the provided text' do
      expect(described_class::Wrapper).
        to receive(:new).
        with(text, 0, 80).
        and_return(dummy)

      expect(dummy).to receive(:wrapped).and_return('wrapped text')

      expect(described_class.wrap(text)).to eql('wrapped text')
    end
  end
end
