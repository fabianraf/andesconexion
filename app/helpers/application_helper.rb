module ApplicationHelper
  def are_you_here?(control,act=nil)
		control = control.downcase
		if act.nil?
			return control == controller.controller_name.downcase
		else
			act = act.downcase
			return (controller.controller_name.downcase == control and controller.action_name.downcase == act)
		end
	end
end
