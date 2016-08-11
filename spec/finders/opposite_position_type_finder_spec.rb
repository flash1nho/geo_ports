require 'rails_helper'

describe OppositePositionTypeFinder do
  let(:finder) { described_class.new(position.type) }

  let(:position) { create :position_cargo }

  describe '#call' do
    context 'when cargo position in params' do
      it { expect(finder.call).to eq Positions::Vessel }
    end

    context 'when vessel position in params' do
      let(:position) { create :position_vessel }

      it { expect(finder.call).to eq Positions::Cargo }
    end
  end
end
