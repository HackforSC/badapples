class SeverityModel
  attr_accessor :object

  def initialize(object)
    @object = object
  end

  def score
    severity_points + income_points
  end

private
  def severity_points
    if object.high_severity?
      3
    elsif object.medium_severity?
      2
    elsif object.low_severity?
      1
    else
      0
    end
  end

  def income_points
    if object.zip_code_median_income.present?
      if object.zip_code_median_income >= 75000
        0
      elsif object.zip_code_median_income >= 50000
        1
      elsif object.zip_code_median_income >= 25000
        2
      else
        3
      end
    else
      1
    end
  end
end
