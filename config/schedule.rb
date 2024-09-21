# frozen_string_literal: true

# Rails.rootを使用するために必要
require File.expand_path("#{File.dirname(__FILE__)}/environment")
# cronを実行する環境変数(:developmentを初期値とする)
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
ENV.each { |k, v| env(k, v) } # これが超大事
# cronの標準出力先（必ずしもlogでなくても良い)
set :output, "#{Rails.root}/log/cron.log"

# 毎朝9時に通知要否の確認と、通知要の場合メール送信を実行
every 1.day, at: '9:00 am' do
  rake 'task_notification:send'
end

every 1.minute do
  rake 'task_notification:send'
end
