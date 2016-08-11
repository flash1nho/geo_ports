require 'rails_helper'

describe PositionService do
  let(:service) { described_class.new(position) }

  let!(:port) { create :port }
  let!(:position) { create :position_vessel, port: port, capacity: 2.0 }

  let!(:find_position) { create :position_cargo, port: port, capacity: 1.0 }

  describe '#call' do
    context 'when ports is blank' do
      before { port.destroy }

      it { expect(service.call).to be_blank }
    end

    context 'when position is not found' do
      before { find_position.destroy }

      it { expect(service.call).to be_blank }
    end

    context 'when all is ok' do
      it { expect(service.call).to eq find_position }
    end
  end
end
