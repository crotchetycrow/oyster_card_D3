require 'oystercard'

describe Oystercard do

  let(:card) { Oystercard.new(40) }
  let(:testing_station) { double :testing_station }
  let(:test_exit_station) { double :test_exit_station }
  let(:history) { {entry_station: "entry_station", exit_station: "exit_station"} }

  describe 'when first created' do
    it { is_expected.to respond_to(:balance) }

    it 'initialises with a blanace of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe 'top up features' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'increases the balance by the argument amount using :top_up' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end

    it 'raises an error if the top_up method puts balance over £90' do
      expect { subject.top_up(100) }.to raise_error("Top up invalid, balance maximum is £90, your current balance is #{subject.balance}")
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it 'store a true value if card was touched in' do
      subject.top_up(5)
      expect(subject.touch_in(testing_station)).to be(true)
    end

    it 'prevents touch in when balance is below £1' do
      expect { subject.touch_in(testing_station) }.to raise_error('Insufficient funds')
    end


    it 'expects the card to remember the station where touched in' do
      card.touch_in(testing_station)
      expect(card.entry_station).to eq testing_station
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out)}

    it 'store a false value if card was touched out' do
      expect(subject.touch_out(testing_station)).to be(false)
     end

    it 'deducts card balance by the fare' do
      expect { subject.touch_out(testing_station) }.to change { subject.balance }.by (-Oystercard::MINIMUM_FARE)
    end

    it 'expects the card to remember the station where touched out' do
      card.touch_out(testing_station)
      expect(card.exit_station).to eq testing_station
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?)}

    it 'tells if in journey' do
      card.touch_in(testing_station)
      expect(card.in_journey?).to eq true
    end

    it 'tells if not in journey' do
      subject.touch_out(testing_station)
      expect(card.in_journey?).to eq false
    end
  end

  describe "#history" do
    it "returns an array with travel history" do
      expect(card.history).to eq card.stations
    end

    it "stores stations into a hash" do
      expect(card.stations).to eq ({})
    end

    it 'stores entry_station and exit_station'do
      card.touch_in("entry_station")
      card.touch_out("exit_station")
      expect(card.stations).to eq history
    end
  end
end
