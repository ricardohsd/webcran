module ApplicationHelper
  def dependency_route(dependency)
    if dependency.dependent_package_id
      package_path(dependency.dependent_package_id)
    else
      root_path(dependent_package_name: dependency.name)
    end
  end
end
