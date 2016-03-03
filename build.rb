require 'csv'
require 'json'
require 'slugify'

primary_key = ENV['PRIMARY_KEY'] || 'id'

csv_files = Dir['./*.csv'].reject { |f| File.directory?(f) }

csv_files.each do |file_name|
  target_dir = File.basename(file_name, '.csv').slugify
  Dir.mkdir(target_dir) unless Dir.exist?(target_dir)

  CSV.foreach(file_name, {
    encoding: 'UTF-8',
    headers: true,
    header_converters: :symbol,
    converters: :all
  }) do |row|
    target_file = row[primary_key.to_sym].to_s.slugify
    row_json = JSON.generate(row.to_hash)
    File.open("#{target_dir}/#{target_file}.json", 'w') { |f| f.write(row_json) }
  end
end
