class Pool < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :pool_memberships
  has_many :members, through: :pool_memberships, source: :user
  after_create :create_owner_pool_membership
  has_many :entries

  private

  def create_owner_pool_membership
    self.pool_memberships.create!(user_id: self.owner_id)
  end

  def create_user_pool_membership
    self.user.pool_memberships.create!(user_id: self.user.id)
  end

end
