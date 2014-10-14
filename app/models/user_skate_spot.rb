class UserSkateSpot < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user

  scope :approved, -> { where(approval: true) }
  scope :pending,  -> { where(approval: false) }


  def approve(spot)
    spot = UserSkateSpot.find_by(id: spot)
    spot.approval = true
    spot.save
  end

  def deny(spot)
    spot = UserSkateSpot.find_by(id: spot)
    spot.approval = false
    spot.save
  end
end