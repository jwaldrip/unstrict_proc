require 'spec_helper'

describe UnstrictProc do
  context 'when a proc' do
    using UnstrictProc
    subject { proc { |a| "Good #{a}" }.unstrict }

    it 'should not raise an argument error for too many arguments' do
      expect(subject.call(1, 2, 3)).to eq 'Good 1'
    end

    it 'should not raise an argument error for too few arguments' do
      expect(subject.call).to eq 'Good '
    end

    it 'should not raise an argument error for just the right number of arguments' do
      expect(subject.call 1).to eq 'Good 1'
    end
  end

  context 'when a lambda' do
    using UnstrictProc
    subject { ->(a) { "Good #{a}" }.unstrict }

    it 'should not raise an argument error for too many arguments' do
      expect(subject.call(1, 2, 3)).to eq 'Good 1'
    end

    it 'should not raise an argument error for too few arguments' do
      expect(subject.call).to eq 'Good '
    end

    it 'should not raise an argument error for just the right number of arguments' do
      expect(subject.call 1).to eq 'Good 1'
    end
  end
end
