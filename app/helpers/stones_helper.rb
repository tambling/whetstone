module StonesHelper
	def current_user_id
		current_user.id rescue ""
	end
end
