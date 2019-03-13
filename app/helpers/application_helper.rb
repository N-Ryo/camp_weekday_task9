module ApplicationHelper

  def status_color(task)
    return "#FF0000" if task.draft?
    return "#0000FF" if task.published?
    return "#008000" if task.archieved?
  end
end
