require '../lib'

describe 'Lib, #get_block' do
  it "should display the first selector if bracket is below" do
    input_file = "../extras_short.css"
    
    lines_array = IO.readlines input_file

    organizer = Organizer.new
    new_block = organizer.get_block(0, lines_array)
    
    new_block[0].gsub(/[^0-9A-Za-z.]/, '').should eq ".header"
  end
  
  it "should display the first selector if the selector is way below" do
    input_file = "../extras_short.css"
    
    lines_array = IO.readlines input_file

    organizer = Organizer.new
    new_block = organizer.get_block(12, lines_array)
    
    new_block[0].gsub(/[^0-9A-Za-z.]/, '').should eq ".headerdiv"
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
  
  it "should be true for .header" do
    organizer = Organizer.new
    
    organizer.line_contains_selector(".header").should be_true
  end
  
  it "should be false for {" do
    organizer = Organizer.new
    
    organizer.line_contains_selector("{").should be_false
  end
  
  it "should be false for /* comment" do
    organizer = Organizer.new
    
    organizer.line_contains_selector("/* comment").should be_false
        organizer.line_contains_selector(" comment *\\").should be_false
  end
  
  it "should be false for { .whatever as it is invalid" do
    organizer = Organizer.new
    
    organizer.line_contains_selector("{ .whatever").should be_false
  end
  
  it "should be false for { background:#222222" do
    organizer = Organizer.new
    
    organizer.line_contains_selector("{ background:#222222").should be_false
  end
end

describe 'Lib, #get_all_blocks' do
  it "should return all blocks which selector starts with .header" do
    input_file = "../extras_short.css"
    lines_array = IO.readlines input_file

    organizer = Organizer.new
    
    all_the_blocks = organizer.get_all_blocks(lines_array, ".header")
    
    all_the_blocks.count.should eq 2
    all_the_blocks[0].should_not eq all_the_blocks[1]
  end
end
