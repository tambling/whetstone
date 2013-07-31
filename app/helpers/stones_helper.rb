module StonesHelper
	def current_user_id
		current_user.id rescue "" # TODO: I don't get this
	end
end
