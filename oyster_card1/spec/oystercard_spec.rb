require 'oystercard'

describe Oystercard do
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

  describe 'deduct features' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'decreases the balance by the argument using :deduct' do
       expect { subject.deduct(10) }.to change { subject.balance }.by(-10)
    end
  end

  describe 'touch_in' do
    it { is_expected.to respond_to(:touch_in)}

    it 'store a true value if card was touched in' do
      expect(subject.touch_in).to be(true)
    end
  end

  describe 'touch_out' do
    it { is_expected.to respond_to(:touch_out)}

    it 'store a false value if card was touched out' do
       expect(subject.touch_out).to be(false)
     end
  end
     describe 'in_journey?' do
       it { is_expected.to respond_to(:in_journey?)}

       it 'tells if in journey' do
           subject.touch_in
           expect(subject.in_journey?).to eq('in journey')
         end

       it 'tells if in journey' do
          subject.touch_out
          expect(subject.in_journey?).to eq('not in journey')
       end
     end


end
