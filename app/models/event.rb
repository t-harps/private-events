class Event < ActiveRecord::Base
	scope :upcoming, -> { where('date >= :today', {today: Time.now.to_date}) }
    scope :past,     -> { where('date <  :today', {today: Time.now.to_date}) }

	belongs_to :creator, :class_name => "User"
	has_many :attendees, :through => :attendents, :source => :event_attendee
	has_many :attendents, :foreign_key => :attended_event_id
end
