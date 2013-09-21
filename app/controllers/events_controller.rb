class EventsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
	end

	private

		def event_params
			params.require(:event).permit(:content, :name, :location, :start_date, :end_date, :price)
		end	

		def correct_user
	      @event = current_user.events.find_by(id: params[:id])
	      redirect_to root_url if @event.nil?
	    end
end