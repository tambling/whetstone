module StonesUsersHelpers do
  def can_be_added?(user, stone_id)
    user.signed_in? && user.goals.find_by_stone_id(stone_id).nil?
  end
end
