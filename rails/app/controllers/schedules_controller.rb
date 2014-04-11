class SchedulesController < SiteController
  
  def index
    @schedules = Schedule.this_week
    @ads = Advertisement.all.sort_by { rand }[0..1]
    @title = "John's Gym Class Schedules | Austin, Texas"
  end
  
  
end
