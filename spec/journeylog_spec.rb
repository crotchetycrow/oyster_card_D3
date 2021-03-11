require "./lib/journeylog"
require "./lib/journey"

describe JourneyLog do
let(:log) { JourneyLog.new(Journey) }
let(:entry_station) { double(:station) }


  describe "journey_class" do
    it "starts a journey" do
      expect(Journey).to receive(:new).with(entry_station)
      log.start(entry_station)
    end
  end
end
