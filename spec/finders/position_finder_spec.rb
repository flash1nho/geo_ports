require 'rails_helper'

describe PositionFinder do
  let(:finder) { described_class.new(options) }

  let(:options) do
    {
      type: Positions::Vessel,
      port_ids: [port_id],
      capacity: capacity,
      date: date
    }
  end

  let(:port_id) { port.id }
  let(:capacity) { position_1.capacity }
  let(:date) { position_1.date_open }

  let!(:port) { create :port }

  describe '#call' do
    shared_examples 'make all keys' do
      context 'when position is not found by ports' do
        let(:port_id) { port.id + 1 }

        it { expect(finder.call).to be_blank }
      end

      context 'when position is not found by date' do
        let(:date) { position_1.date_open + 1.day }

        it { expect(finder.call).to be_blank }
      end

      context 'when all is ok' do
        it { expect(finder.call).to eq position_2 }
      end
    end

    context 'when cargo' do
      let!(:position_1) { create :position_cargo, port: port, capacity: 100.0 }
      let!(:position_2) { create :position_vessel, port: port, capacity: 101.0 }

      context 'when position is not found by capacity' do
        let(:capacity) { 102 }

        it { expect(finder.call).to be_blank }
      end

      it_behaves_like 'make all keys'
    end

    context 'when vessel' do
      let!(:position_1) { create :position_vessel, port: port, capacity: 101.0 }
      let!(:position_2) { create :position_cargo, port: port, capacity: 100.0 }

      before { options.merge!(type: Positions::Cargo) }

      context 'when position is not found by capacity' do
        let(:capacity) { 99.0 }

        it { expect(finder.call).to be_blank }
      end

      it_behaves_like 'make all keys'
    end
  end
end
