require 'fileutils'
require 'csv'
require 'json'
require 'slugify'

BUILD_DIR = 'dist'
FileUtils.rm_rf(BUILD_DIR) if Dir.exist?(BUILD_DIR)
Dir.mkdir(BUILD_DIR)

primary_key = ENV['PRIMARY_KEY'] || 'id'

csv_files = Dir['./*.csv'].reject { |f| File.directory?(f) }

csv_files.each do |file_name|
  dataset_slug = File.basename(file_name, '.csv').slugify
  Dir.mkdir("#{BUILD_DIR}/#{dataset_slug}") unless Dir.exist?("#{BUILD_DIR}/#{dataset_slug}")

  rows = Array.new

  # Write a file for each row
  CSV.foreach(file_name, {
    encoding: 'UTF-8',
    headers: true,
    header_converters: :symbol,
    converters: :all
  }) do |row|
    rows.push(row.to_hash)
    target_file = row[primary_key.to_sym].to_s.slugify
    row_json = JSON.generate(row.to_hash)
    File.open("#{BUILD_DIR}/#{dataset_slug}/#{target_file}.json", 'w') { |f| f.write(row_json) }
  end

  # Write full dataset to file
  rows_json = JSON.generate(rows)
  File.open("#{BUILD_DIR}/#{dataset_slug}.json", 'w') { |f| f.write(rows_json) }
end
