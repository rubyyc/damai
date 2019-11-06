class Event < ApplicationRecord

 validates_presence_of :name

 STATUS = ["draft", "public", "private"]
 validates_inclusion_of :status, :in => STATUS

 def to_param
  "#{self.id}-#{self.name}"
 end

end
