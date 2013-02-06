module ThingsHelper
  def pick_up_time(thing)
    thing.expires_at.nil? ? "Whenever" : distance_of_time_in_words(thing.expires_at, Time.now)
  end
end
