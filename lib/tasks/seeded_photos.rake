# require "#{Rails.root}/app/helpers/image_helper"
require "#{Rails.root}/lib/image_helper"
include ImageHelper
namespace :seeded do
  task :photos => :environment do
    Resource.where("photo IS NULL").each do |photo|
      photo.update_attribute(:photo, top_image(photo.url))
    end
  end
end
