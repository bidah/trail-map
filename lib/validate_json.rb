#!/usr/bin/env ruby

Dir['lib/helpers/*.rb'].each { |f| require File.expand_path(f) }

TrailRunner.new.run
