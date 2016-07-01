require_relative 'spec_helper'

describe Battery do 

  before :each do
    @battery = Battery.new
  end

  it "should have a weight of 25" do
    expect(@battery.weight).to eql 25
  end

  describe "#feed" do

    it "should recharge a robot's shield to full" do
      robot = double("Robot")
      expect(robot).to receive(:recharge_shield).with(50)
      @battery.feed(robot)
    end

  end
  
end