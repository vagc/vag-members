namespace :export do
  desc "Export Members" 
  task :export_member_to_seeds => :environment do
    Member.all.each do |member| 
      excluded_keys = ['created_at', 'updated_at', 'id']
      serialized = member
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "Member.create(#{serialized})"
    end 
  end

	task :export_sticker_to_seeds => :environment do
    Sticker.all.each do |sticker| 
      excluded_keys = ['created_at', 'updated_at', 'id'] 
      serialized = sticker
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "Sticker.create(#{serialized})"
    end 
  end
end