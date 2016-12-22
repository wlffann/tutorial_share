module ApplicationHelper

  def verb(object)
    if object.id == nil
      "Create"
    else
      "Update"
    end
  end

end
