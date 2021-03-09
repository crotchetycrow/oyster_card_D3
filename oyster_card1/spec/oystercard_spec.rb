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


end
