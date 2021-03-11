require 'journey'

describe Journey do
  let (:entry_station) { double(:station) }
  let (:finish_station) { double(:station) }
  let (:test_journey) { Journey.new(entry_station) }

  describe "#completed?" do
    context "when start new journey" do
      it "shows false" do
        expect(test_journey.completed?).to eq false
      end
    end

    context "when finish the journey" do
      it "shows true" do
        test_journey.finish(finish_station)
        expect(test_journey.completed?).to eq true
      end
    end
  end

  describe "#fare" do
    context "when journey not complete" do
      it "charges penalty fare" do
        expect(test_journey.fare).to eq described_class::PENALTY_FARE
      end
    end

  end

end