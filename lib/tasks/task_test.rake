# frozen_string_literal: true

namespace :task_test do
  desc 'mailを送信する'
  task hello: :environment do
    puts 'hello!!!!!!!!!'
  end
end
