namespace :photo  do
  task :choose => :environment do
    unless Attachment.all.blank?
      Attachment.where(main: true).each {|a| a.update_attributes(main: false)}
      Attachment.order("RANDOM()").first.update_attributes(main: true)
    end
  end
end
