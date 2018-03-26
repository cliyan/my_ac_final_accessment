namespace :dev do
  task fake: :environment do
    Note.destroy_all

    20.times do |i|
      Note.create!(post: "note#{i.to_s}",
        post: FFaker::Lorem.paragraph
      )
    end
    puts "have created fake notes"
    puts "now you have #{Note.count} notes data"
  end
end