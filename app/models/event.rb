class Event < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :content, presence: true
	validates :name, presence: true
	validates :location, presence: true
	validates :price, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
end