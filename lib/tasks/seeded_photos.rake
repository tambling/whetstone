require "#{Rails.root}/app/helpers/resource_helper"
include ResourceHelper
namespace :seeded do
  task :photos => :environment do
    Resource.where("photo IS NULL").each do |photo|
      photo.update_attribute(:photo, top_image_url(photo.title))
    end
  end
end
