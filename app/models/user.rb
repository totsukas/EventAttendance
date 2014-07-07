class User < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :name
  named_scope :present, :conditions => {:att => 1}
  named_scope :blank, :conditions => {:att => -1}
  named_scope :absence, :conditions => {:att => 0}
end
