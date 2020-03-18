require 'open-uri'

namespace :users do
  desc "Add fake avatars to users"
  task generate_avatars_for_users: :environment do
    User.all.each do |user|
      download = begin
                   open(Faker::Avatar.image)
                 rescue => error
                   retry if error
                 end
      image_path = "#{Dir.pwd}/tmp/avatars/#{download.base_uri.to_s.split('/')[-1].split('?')[0]}"
      IO.copy_stream(download, image_path)
      File.open(image_path) { |f| user.update!(avatar: f) }
      File.delete(image_path) if File.exist?(image_path)
    end
  end

  desc "Add fake avatars to users"
  task fake_emails_for_users: :environment do
    User.where(email: nil).each do |user|
      user.update!(email: Faker::Internet.email)
    end
  end
end
