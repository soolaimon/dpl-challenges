module ApplicationHelper

  def show_flash_message
    [:success, :notice, :error].each do |msg|
      return %{<div id="flash" class="#{msg.to_s}">#{image_tag(msg.to_s + '.png')} #{flash[msg]}</div>} if flash[msg]
    end unless flash.empty?
  end

  def page_title(title = '')
    title.blank? ? "John's Gym | Martial Arts, Boxing, Self Defense, Fitness Training | Austin, TX" : title
  end

  def page_keywords(keywords = '')
    "#{keywords}"
  end

  def page_description(description = '')
    description.blank? ? "John's Gym ATX in Austin, TX. Family Fitness, Self Defense, Hard Training" : description
  end

  def link_to_just_professionals
    if request.url == root_url
      link_to('MMA Web Design', "http://www.justprofessionals.com", :target => "_blank")
    else
      link_to('MMA Web Design', "http://www.justprofessionals.com", :target => "_blank", :rel => "nofollow")
    end
  end

  def google_analytics
    if Rails.env.production?
      %{<script type="text/javascript"></script>}
    end
  end


end
