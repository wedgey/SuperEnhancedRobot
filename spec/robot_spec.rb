require_relative 'spec_helper'
describe Robot do 
  before :each do
    @robot = Robot.new

  end

  describe "#heal!" do

    it "should not be revived" do
      allow(@robot).to receive(:shield).and_return(0)
      @robot.wound(100)
      expect(@robot.health).to eql(0)

      expect { @robot.heal!(20) }.to raise_exception
    end

    it "should heal the robot if it is not dead" do
      allow(@robot).to receive(:shield).and_return(0)
      @robot.wound(50)
      @robot.heal!(10)
      expect(@robot.health).to eql 60
    end

  end

  describe "#attack!" do

    it "should attack another robot" do
      robot2 = Robot.new
      allow(robot2).to receive(:shield).and_return(0)
      @robot.attack!(robot2)
      expect(robot2.health).to eql(95)
    end

    it "should not attack someone if they're not a robot" do
      someone = Object.new
      expect {@robot.attack!(someone)}.to raise_exception
    end

  end

end