class Micropost < ActiveRecord::Base
  # permisos
  attr_accessible :content
  
  # relaciones
  belongs_to :user
  
  # validaciones
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  # scopes
  default_scope :order => 'microposts.created_at DESC' # SQL
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  # métodos privados
private
  def self.followed_by(user)
    followed_ids = %(SELECT followed_id FROM relationships
      WHERE follower_id = :user_id)
    where("user_id IN (#{followed_ids}) OR user_id = :user_id",
      { :user_id => user })
  end
end
