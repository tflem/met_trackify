module ApplicationHelper
  def title(*content)
    unless content.empty?
      content_for :title do
        (content << "Met Trackify").join(" - ")
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
end
