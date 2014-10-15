require 'rails_helper'

describe UserSkateSpot do
  it 'sets a default value of false for a new user spot approval' do
    spot = UserSkateSpot.create
    expect(spot.approval).to eq(false)
  end

  it 'can change the approval of a user spot' do
    spot = UserSkateSpot.create

    spot.approve(spot)

    expect(spot.approval).to eq(true)

    spot.deny(spot)

    expect(spot.approval).to eq(false)
  end
end