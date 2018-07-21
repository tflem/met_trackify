module ApplicationHelper
  def title(*content)
    unless content.empty?
      content_for :title do
        (content << "Met Trackify").join(" - ")
      end
    end
  end
end
