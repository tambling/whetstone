module StonesHelper
	def current_user_id
		current_user.id rescue ""
	end

  def get_coordinates i
    row = (i / 4) + 1
    col = (i % 4) + 1
    return row, col
  end
end
