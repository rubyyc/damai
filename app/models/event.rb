class Event < ApplicationRecord
 mount_uploader :logo, EventLogoUploader

 mount_uploaders :images, EventImageUploader
 serialize :images, JSON

 include RankedModel
 ranks :row_order

 validates_presence_of :name



 STATUS = ["draft", "public", "private"]
 validates_inclusion_of :status, :in => STATUS

 belongs_to :category, :optional => true

 has_many :registration_imports, :dependent => :destroy


 has_many :tickets, :dependent => :destroy, :inverse_of  => :event
 accepts_nested_attributes_for :tickets, :allow_destroy => true, :reject_if => :all_blank

 has_many :attachments, :class_name => "EventAttachment", :dependent => :destroy
 accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank


 has_many :registrations, :dependent => :destroy

 scope :only_public, -> { where( :status => "public" ) }
 scope :only_available, -> { where( :status => ["public", "private"] ) }


 def to_param
  "#{self.id}-#{self.name}"
 end

end
