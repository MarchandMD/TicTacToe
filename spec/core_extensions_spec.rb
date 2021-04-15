require_relative 'spec_helper'

RSpec.describe Array do
  context '#all_empty?' do
    it 'returns true if all elements of the Array are empty' do
      expect(['', '', ''].all_empty?).to be true
    end
  end

  context '#all_same?' do
    it 'returns true if all the elements are the same' do
      expect(%w[A A A].all_same?).to be true
    end

    it 'returns false if all the elements are not the same' do
      expect(%w[A B A].all_same?).to be false
    end

    it 'returns true for an empty array' do
      expect([].all_same?).to be true
    end
  end

  context '#any_empty?' do
    it 'returns true if any elements are empty' do
      expect(['', 'A', 'B'].any_empty?).to be true
    end

    it 'returns false if none of the elements are empty' do
      expect(['A', 'B', []].any_empty?).to be false
    end

    it 'returns true if all of the elements are empty' do
      expect(['', '', ''].any_empty?).to be true
    end
  end

  context '#none_empty?' do
    it 'returns true if none of the elements are empty' do
      expect(['A', 'B', []].none_empty?).to be true
    end

    it 'returns false if an element is empty' do
      expect(['A', 'B', ''].none_empty?).to be false
    end
  end
end
