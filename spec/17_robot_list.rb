require_relative 'spec_helper'

describe Robot do 

  before :each do
    Robot.class_variable_set :@@list, []
    @robot = Robot.new
    @robot2 = Robot.new
  end

  it "Robot class should know all robots initialized" do
    expect(Robot.list.length).to eql 2
    expect(Robot.list[1]).to eq @robot2
  end

end