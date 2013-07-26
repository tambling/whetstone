class Timeline < ActiveRecord::Base
  attr_accessible :end_date, :start_date
  belongs_to :stones_user
end
