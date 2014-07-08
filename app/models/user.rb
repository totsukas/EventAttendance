class User < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :name
  validates_presence_of :yomi
  validates_format_of :yomi,:with => /^[0-9A-Za-z]/, :message =>"using half-width characters."
  named_scope :present, :conditions => {:att => 1}
  named_scope :blank, :conditions => {:att => -1}
  named_scope :absence, :conditions => {:att => 0}
end
