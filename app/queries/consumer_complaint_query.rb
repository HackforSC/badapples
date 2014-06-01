class ConsumerComplaintQuery
  attr_accessor :relation

  def initialize(relation = ConsumerComplaint.scoped)
    @relation = relation.extending(Scopes)
  end
  
  def in(state_code = nil)
    if state_code.present?
      relation.with_state_code(state_code)
    else
      relation
    end
  end
 
  def by_state_and_product(state_code = nil, product = nil)
    if state_code.present?
      if product.nil?
        relation.with_state_code(state_code)
      else
        relation.with_state_code(state_code).with_product(product)
      end
    else
      if product.nil?
        relation
      else
        relation.with_product(product)
      end
    end
  end

  module Scopes
    def with_state_code(state_code)
      where("state = ?", state_code)
    end

    def with_zip_code(zip_code)
      where("zip = ?", zip_code)
    end

    def with_product(product)
      where("product = ?", product)
    end
  end
end
