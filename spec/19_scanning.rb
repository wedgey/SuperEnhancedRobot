require_relative 'spec_helper'

describe Robot do 

  describe "#scan" do

    it "should be able to get a list of all neighboring robots" do
      robot = Robot.new
      robot2 = Robot.new
      robot3 = Robot.new
      robot4 = Robot.new
      robot.move_up
      robot.move_up
      robot3.move_left
      robot4.move_right

      expect(robot2.scan).to include(robot2, robot3, robot4)
    end

    it "should return just itself if there are no neighbors" do
      robot = Robot.new
      robot2 = Robot.new
      robot3 = Robot.new
      robot4 = Robot.new
      robot.move_up
      robot.move_up
      robot3.move_left
      robot4.move_right

      expect(robot.scan).to include(robot)
    end

  end

end