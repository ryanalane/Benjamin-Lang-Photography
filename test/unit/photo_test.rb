require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  
  should have_attached_file(:image)
  
end
