require "./lib/journeylog"

describe JourneyLog do
  let(:journey_class) { double(:journey_class) }
  let(:log) { JourneyLog.new(journey_class) }
  let(:test_station) { double(:station) }

  describe "#start" do
    it "starts a journey" do
      expect(journey_class).to receive(:new).with(test_station)
      log.start(test_station)
    end
  end

  describe "#finish" do
    it "finish a journey" do
      expect(journey_class).to receive(:new).with(test_station)
      log.start(test_station)
      expect(journey_class).to receive(:finish).with(test_station)
      log.finish(test_station)
    end
  end
end
