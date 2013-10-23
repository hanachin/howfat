require 'pp'

namespace :fitbit do
  task update_twitter_profile: :environment do
    def params
      {
        'api-method' => 'api-get-body-weight',
        'response-format' => 'json',
        'base-date' => 30.days.ago.strftime("%Y-%m-%d"),
        'end-date'  => Time.now.strftime("%Y-%m-%d")
      }
    end

    User.all.select {|u| u.token && u.secret && u.twitter_token && u.twitter_secret }.each do |u|
      res = Fitbit::Api.new({}).api_call(
        Settings.fitbit.consumer_key,
        Settings.fitbit.consumer_secret,
        params,
        u.token,
        u.secret
      )

      next unless res.code == '200'

      res_json = MultiJson.load(res.body)

      next unless latest_weight = res_json['weight'].last

      puts "#{u.name}(#{latest_weight['weight']}kg, BMI#{latest_weight['bmi']})"
    end
  end
end
