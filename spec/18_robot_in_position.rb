require_relative 'spec_helper'

describe Robot do 
  before :each do
    Robot.class_variable_set :@@list, []
    @robot = Robot.new
    @robot2 = Robot.new
  end

  describe "#in_position" do

    it "should return all robots at a given position" do
      expect(Robot.in_position(0,0)).to eql [@robot, @robot2]
    end

    it "should not return robots that are not at that position" do
      @robot.move_up
      expect(Robot.in_position(0,1)).to eql [@robot]
    end

  end

end