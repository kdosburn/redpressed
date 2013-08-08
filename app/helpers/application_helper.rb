module ApplicationHelper

	#returns full title even if no particular page is defined
	def full_title(page_title) #method definition
		base_title = "KO" #variable assignment
		if page_title.empty? #boolean test
			base_title #implicit return
		else
			"#{base_title} | #{page_title}" #string interpolation 
		end
	end
end
