require 'spec_helper'

module Wrapomatic
  describe Wrapper do
    let(:dummy) {Object.new}
    let(:text) {"This is some text to wrap. It is intentionally long and contains a few newlines\nto ensure that all of the features of the wrapper\nwork\nas\nexpected."}

    describe '.new' do
      it 'has a default indentation level' do
        expect(described_class.new(text).indents).to eql(0)
        expect(described_class.new(text, 1).indents).to eql(1)
      end

      it 'has a default column cutoff' do
        expect(described_class.new(text).columns).to eql(80)
        expect(described_class.new(text, 0, 10).columns).to eql(10)
      end
    end

    describe '#lines' do
      let(:wrapper) {described_class.new(text)}
      let(:lines) {wrapper.lines}

      it 'is an array of strings' do
        expect(lines).to be_a(Array)
        lines.each do |line|
          expect(line).to be_a(String)
        end
      end

      it 'contains no line that is bigger than the cutoff' do
        lines.each do |line|
          expect(line.length > wrapper.columns).to eql(false)
        end
      end
    end

    describe '#wrapped' do
      let(:wrapper) {described_class.new(text)}
      let(:lines) {wrapper.lines}
      let(:wrapped) {wrapper.wrapped}

      it 'is lines joined by newlines' do
        expect(wrapped).to eql(lines.join("\n"))
      end
    end
  end
end
