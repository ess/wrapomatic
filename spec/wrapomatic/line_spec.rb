require 'spec_helper'

module Wrapomatic
  describe Line do
    let(:original) {''}
    let(:indents) {0}
    let(:columns) {80}
    let(:line) {described_class.new(original, indents, columns)}

    it 'has a reader for the original text' do
      expect(line.original).to eql(original)
    end

    it 'has a reader for the specified indents' do
      expect(line.indents).to eql(indents)
    end

    it 'has a reader for the specified columns' do
      expect(line.columns).to eql(columns)
    end

    describe '#wrapped' do
      it 'is an array of strings' do
        [
          '',
          'this is a short line',
          'this is a very long line that will, with any luck whatsoever, cause the wrapped line to be more than one item, given that the columns for this test is set to 80',
          'thisisanotherlinethatislongerthanthecolumnbreakbutcontainszerowhitespacecharactersbecausewewanttomakesurethatthiscaseishandled'
        ].map {|line|
          described_class.new(line, indents, columns).wrapped
        }.each do |wrapped|
          expect(wrapped).to be_a(Array)
          wrapped.each do |wrapped_line|
            expect(wrapped_line).to be_a(String)
          end
        end
      end

      context 'when breaking a line' do
        it 'converts the last space before the column cutoff to a break' do
          original = 'first line starts right here and will take up almost all of the provided columns second line'

          wrapped = described_class.new(original, indents, columns).wrapped

          expect(wrapped).to eql(
            [
              'first line starts right here and will take up almost all of the provided columns',
              'second line'
            ]
          )
        end

        it 'still breaks properly with indents' do
          original = 'first indented line starts right here and almost run to the columns cutoff second line'

          wrapped = described_class.new(original, 1, columns).wrapped

          expect(wrapped).to eql(
            [
              '  first indented line starts right here and almost run to the columns cutoff',
              '  second line'
            ]
          )
        end

        it 'still breaks properly with extremely long lines' do
          original = 'firstline........................................................................secondline'
          line = described_class.new(original, indents, columns)

          wrapped = line.wrapped

          expect(wrapped).to eql(
            [
              'firstline........................................................................',
              'secondline'
            ]
          )
        end

        it 'still breaks properly while indenting extremely long lines' do
          original = 'firstline......................................................................secondline'

          wrapped = described_class.new(original, 1, columns).wrapped

          expect(wrapped).to eql(
            [
              '  firstline......................................................................',
              '  secondline'
            ]
          )
        end
      end
    end
  end
end
