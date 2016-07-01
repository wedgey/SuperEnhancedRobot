require_relative 'spec_helper'

describe AoeWeapon do 

  before :each do
    @aoe_weapon = AoeWeapon.new
  end

  it "should be an instance of the weapon class" do
    expect(@aoe_weapon).to be_a Weapon
  end

  it "should have a range of 1" do
    expect(@aoe_weapon.range).to eql 1
  end

  it "should be a consumable" do
    expect(@aoe_weapon.consumable).to eql true
  end

  it "should penetrate shields" do
    robot = double("Robot")
    expect(robot).to receive(:scan).and_return([robot])
    expect(robot).to receive(:wound).with(30,true)
    @aoe_weapon.hit(robot)
  end

  it "should penetrate a robot instance's shield" do
    robot = Robot.new
    @aoe_weapon.hit(robot)
    expect(robot.health).to eql 70
  end

  it "should hit all robots around the target" do
    robot = Robot.new
    robot2 = Robot.new
    robot3 = Robot.new
    robot4 = Robot.new
    robot.move_up
    robot.move_up
    robot3.move_left
    robot4.move_right
    @aoe_weapon.hit(robot2)
    expect(robot2.health).to eql 70
    expect(robot3.health).to eql 70
    expect(robot4.health).to eql 70
    expect(robot.health).to eql 100
  end

end