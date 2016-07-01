require_relative 'spec_helper'

describe Robot do 

  before :each do
    @robot = Robot.new
  end

  it "should start with 50 shield points" do
    expect(@robot.shield).to eql(50)
  end

  describe "#attack" do

    it "should drain the shield first before doing health damage" do
      @robot.wound(60)
      expect(@robot.shield).to eql(0)
      expect(@robot.health).to eql(90)
    end

  end

  describe "#recharge_shield" do

    it "should recharge the robot's shield a certain amount" do
      @robot.wound(60)
      @robot.recharge_shield(50)
      expect(@robot.shield).to eql(50)
    end

    it "should not charge a robot's shield over it's max" do
      @robot.wound(10)
      @robot.recharge_shield(50)
      expect(@robot.shield).to eql(50)
    end

  end

end