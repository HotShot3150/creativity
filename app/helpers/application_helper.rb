module ApplicationHelper

	def pretty_date(timestamp = Time.now)
		if timestamp > 24.hours.ago 
			time_ago_in_words(timestamp) + " ago" 
		else
			timestamp.strftime("%a %B %e, %Y at %l:%M%P")
		end
	end
end
