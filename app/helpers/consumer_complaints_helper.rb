module ConsumerComplaintsHelper
  def public_state_options
    {
      "All" => nil,
      "South Carolina" => "SC",
      "North Carolina" => "NC",
      "Virginia" => "VA",
    }
  end

  def public_product_options
    unique_values = ConsumerComplaint.all.map { |a| a.product }.uniq
    options_for_select(
      [[ "All", nil ]] + unique_values
    )
  end
end
