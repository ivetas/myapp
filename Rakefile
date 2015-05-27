# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :spec do
  # largely lifted from http://www.pervasivecode.com/blog/2007/06/28/hacking-rakestats-to-get-gross-loc/
  task :stats_setup do
  require 'rails/code_statistics'

  class CodeStatistics
    alias calculate_statistics_orig calculate_statistics
    def calculate_statistics
      @pairs.inject({}) do |stats, pair|
        if 3 == pair.size
          stats[pair.first] = calculate_directory_statistics(pair[1], pair[2]); stats
        else
          stats[pair.first] = calculate_directory_statistics(pair.last); stats
        end
      end
    end
  end
  ::STATS_DIRECTORIES = []
  ::STATS_DIRECTORIES << ['Controllers',  'app/controllers', /\.(rb)$/]
  ::STATS_DIRECTORIES << ['Views',  'app/views', /\.(haml)$/]
  ::STATS_DIRECTORIES << ['Models',  'app/models', /\.(rb)$/]
  ::STATS_DIRECTORIES << ['CSS',  'app/assets/stylesheets', /\.scss$/]
  ::STATS_DIRECTORIES << ['Factories spec',  'spec/factories', /\.(rb)$/]
  end
end

namespace :stats do
  desc "Report code statistics (KLOCs, etc) for non-code like HTML and CSS from the application"
  task :static => ["spec:stats_setup", "stats"]
end
