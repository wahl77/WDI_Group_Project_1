module ApplicationHelper
  
  def page_title(title="Linker")
    content_for :page_title do
      title
    end
  end
end
