class SiteController < ApplicationController
  
  #before_filter :check_uri
  
  def index
    @specials = Special.all(:order => 'created_at DESC')
    @ad = Advertisement.all.sort_by { rand }.first
    @photos = GalleryPhoto.all
    @kvideo = Video.find_all_by_kind('kids').sort_by { rand }.first
    @avideo = Video.find_all_by_kind('adults').sort_by { rand }.first
    @billboards = Billboard.all(:limit => 3)
    @title = "Martial Arts | Jiu Jitsu, Boxing, Kickboxing | Family Fitness Gym - John's Gym Austin, Texas"
  end
  
  def about
    
  end
  
  def contact
    if request.post?
      Notifier.deliver_contact_request(params)
      flash[:success] = 'Thank you for contacting us'
      redirect_to contact_path
    end
  end
  
  def programs
    @courses = Course.find_all_by_course_type('Program', :order => 'title DESC')
    @title = "Fitness Programs | Self Defense Classes | Martial Arts Training | Austin, Texas"
  end
  
  def disciplines
    @courses = Course.find_all_by_course_type('Discipline', :order => 'title DESC')
  end
  
  def instructors
    @instructors = Instructor.all(:order => 'name DESC')
  end
  
end
