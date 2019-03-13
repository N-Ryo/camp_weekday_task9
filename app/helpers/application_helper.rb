module ApplicationHelper

  def status_color(status)
    return "#FF0000" if status.draft?
    return "#0000FF" if status.published?
    return "#008000" if status.archieved?
  end
end
