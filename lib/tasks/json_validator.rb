require 'rubygems'
require 'json'
require 'colored'

class JSONValidator
  def initialize(file_name)
    @file_name = file_name
    @contents = File.open(@file_name).read
  end

  def run
    check_json_validation
  end

  private

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
    print_starting_message
    run_validations_on_json_files
    print_closing_puts
  end

  private

  def print_starting_message
    puts 'Starting JSON validation'
    puts
  end

  def run_validations_on_json_files
    json_files.each do |file_name|
      JSONValidator.new(file_name).run
    end
  end

  def json_files
    Dir["#{script_directory}/../../**/*.json"]
  end

  def script_directory
    File.dirname(__FILE__)
  end

  def print_closing_puts
    puts
  end
end

TrailRunner.new.run
