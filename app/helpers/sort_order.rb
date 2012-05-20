module SortOrder
  #
	#  Takes a list of ids in new order
	#
	#  example:
	#  [43,52,67,92] -- ids
	#
	#  client with id = 43 is sort_order = 0
	#  client with id = 52 is sort_order = 1
	#  etc...
	#
	def self.included(klass)
		klass.class_eval <<-ruby_eval
			default_scope :order => 'sort_order'
			
      		def klass.order=(ids)
				ids = ids.map { |id| id.to_i } # ensure integer
			
				entries = self.find(:all) # get all

				# set new order
				entries.each do |entry|
					entry.sort_order = ids.index(entry.id)
					entry.save
				end
			end
		ruby_eval
	end
end

