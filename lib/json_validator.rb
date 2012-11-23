require 'rubygems'
require 'json'
require 'colored'

class JSONValidator
  def initialize(file_name)
    @file_name = file_name
    @contents = contents
  end

  def run
    check_json_validation
  end

  private

  def contents
    File.open(@file_name).read
  end

  def check_json_validation
    if valid_json?
      print_progress_marker
    else
      print_error_message
    end
  end

  def valid_json?
    begin
      JSON.parse(@contents)
      return true
    rescue Exception => e
      return false
    end
  end

  def print_progress_marker
    print '.'.green
  end

  def print_error_message
    puts "\nERROR: #{@file_name} is not valid JSON.".red
  end
end

class TrailRunner
  def run
    check_directory
    print_starting_message
    run_validations_on_json_files
    print_closing_puts
  end

  private

  def check_directory
    if current_directory != 'trail-map'
      print_directory_error
    end
  end

  def current_directory
    File.basename(Dir.getwd)
  end

  def print_directory_error
    puts 'ERROR: Run from trail-map project root'.red
    exit
  end

  def print_starting_message
    puts 'Starting JSON validation'
    puts
  end

  def run_validations_on_json_files
    Dir['**/*.json'].each do |file_name|
      JSONValidator.new(file_name).run
    end
  end

  def print_closing_puts
    puts
  end
end

TrailRunner.new.run
