class Event < ApplicationRecord
  belongs to :creator, class_name: "User"
end
