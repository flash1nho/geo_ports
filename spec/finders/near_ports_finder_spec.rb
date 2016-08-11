require 'rails_helper'

describe NearPortsFinder do
  let(:finder) { described_class.new(port) }

  let!(:port) { create :port, lat: -58.17256227443719, lng: -156.65548382095133 }

  describe '#call' do
    context 'when port is not found' do
      before do
        port.lat = -48.17256227443719
        port.lng = -1.65548382095133
      end

      it { expect(finder.call).to be_blank }
    end

    context 'when all is ok' do
      it { expect(finder.call).to eq Array.wrap(port) }
    end
  end
end
