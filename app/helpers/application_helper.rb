module ApplicationHelper
  def age
    d  = Date.today
    bd = Date.new(Settings.birthday.year, Settings.birthday.month, Settings.birthday.day)

    a = d.year - bd.year
    a = a - 1 if (
       bd.month >  d.month or
      (bd.month >= d.month and bd.day > d.day)
    )
    a
  end

  def latest_tweets
    begin
      Twitter.user_timeline(Settings.handle).first(5)
    rescue
      []
    end
  end
end
