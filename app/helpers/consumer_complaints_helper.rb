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
    options_for_select(
      [[ "All", nil ]] + ConsumerComplaint.all.map { |a| a.product }.uniq
    )
  end

  def company_names(collection = ConsumerComplaint.all)
    collection.map { |a| a.company }.uniq
  end
end
