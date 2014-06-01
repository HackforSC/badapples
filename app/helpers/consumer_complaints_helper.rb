module ConsumerComplaintsHelper
  def state_scope(state = nil)
    select_tag("state", state_options(state), class: "issue_state")
  end
 
  def zip_code_scope(state = nil)
    select_tag("state", zip_options(state), class: "zip_code")
  end

  private
  def state_options(current = nil)
    options_for_select({
      "All" => nil,
      "South Carolina" => "SC",
      "North Carolina" => "NC",
      "Virginia" => "VA",
    }, selected: current)
  end

  def zip_options(zip = nil)
    options_for_select(
      ConsumerComplaint.all.map { |a| a.zip_code }.uniq
    )
  end
end
