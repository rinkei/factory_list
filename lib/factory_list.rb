require "factory_list/version"
require 'factory_bot'

module FactoryList
  class Error < StandardError; end

  def list
    dirs = ::FactoryBot.definition_file_paths.map(&:to_s)
    dirs.each do |dir|
      puts "dir: #{dir}"
      Dir.glob('**/*.rb', File::FNM_DOTMATCH, base: dir).each do |file|
        puts "file: #{file}"
        file_path = File.join(dir, file)
        File.open(file_path, 'r') do |f|
          tokens = Ripper.tokenize(f.read)
          tokens.each_with_index do |token, i|
            if token == 'factory'
              factory = tokens[i + 3]
              puts "\tfactory: #{factory}"
            elsif token == 'trait'
              trait = tokens[i + 3]
              puts "\t\ttrait: #{trait}"
            end
          end
        end
      end
    end
  end

  module_function :list
end
