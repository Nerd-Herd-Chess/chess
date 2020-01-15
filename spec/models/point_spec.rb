require 'rails_helper'

RSpec.describe Point, type: :model do
 
  describe 'from_location' do
    it 'returns 1,1 from location B2' do
      location = "B2"
      point = Point.from_location(location)
      expect(point.x).to be 1
      expect(point.y).to be 1

    end


    it 'returns 0,0 from location A1' do
      location = "A1"
      point = Point.from_location(location)
      expect(point.x).to be 0
      expect(point.y).to be 0

    end

    it 'returns 7,7 from location H8' do
      location = "H8"
      point = Point.from_location(location)
      expect(point.x).to be 7
      expect(point.y).to be 7

    end
  end

  describe 'to_location' do
    it 'returns A1 from 0,0' do
      point = Point.new(0 , 0)
      location = point.to_location
      expect(location).to eq("A1")
    end

    it 'returns H8 from 7,7' do
      point = Point.new(7 , 7)
      location = point.to_location
      expect(location).to eq("H8")
    end

    it 'returns D4 from 3,3' do
      point = Point.new(3 , 3)
      location = point.to_location
      expect(location).to eq("D4")
    end
  end


end