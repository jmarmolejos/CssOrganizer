require '../lib'

describe 'Lib, #get_block' do
  it "should display the first selector if bracket is below" do
    input_file = "../extras_short.css"
    
    lines_array = IO.readlines input_file

    organizer = Organizer.new
    new_block = organizer.get_block(0, lines_array)
    
    new_block[0].gsub(/[^0-9A-Za-z.]/, '').should eq ".header"
  end
  
  it "should display the first selector" do
    input_file = "../extras.css"
    
    lines_array = IO.readlines input_file

    organizer = Organizer.new
    new_block = organizer.get_block(0, lines_array)
    
    new_block[0].gsub(/[^0-9A-Za-z]/, '').should eq "header"
  end
end

describe 'Lib, #line_contains_selector' do
  it "should be false for {" do
    organizer = Organizer.new
    
    organizer.line_contains_selector("{").should be_false
  end
  
  it "should be true for { .whatever" do
    organizer = Organizer.new
    
    organizer.line_contains_selector("{ .whatever").should be_true
  end
  
  it "should be false for { background:#222222" do
    organizer = Organizer.new
    
    organizer.line_contains_selector("{ background:#222222").should be_false
  end
end
