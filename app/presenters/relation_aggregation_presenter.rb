class RelationAggregationPresenter
  attr_accessor :relation

  def initialize(relation)
    @relation = relation
  end

  def records_by_group(attribute)
    Hash.new.tap do |h|
      unique_values(attribute).each do |v|
        count = relation.select { |r| r.send(attribute) == v }.count
        h.merge!( v.to_s => count )
      end
    end
  end


  def severity_by_group(attribute)
    Hash.new.tap do |h|
      unique_values(attribute).each do |v|
        records = relation.select { |r| r.send(attribute) == v }
        sum = records.inject(0) { |total, record| total += record.severity_score }
        avg = sum.to_d / records.count.to_d
        h.merge!( v.to_s => avg.round(2) )
      end
    end
  end


  def trends_by_group(attribute, time_attribute)
    Array.new.tap do |array|
      unique_values(attribute).each do |v|
        data = Hash.new.tap do |h|
          unique_values(time_attribute).each do |t|
            count = relation.select { |r| (r.send(attribute) == v) && (r.send(time_attribute) == t) }.count
            h.merge!( t.to_s => count )
          end
        end

        array << { v.to_s => data }
      end
    end
  end

private
  def unique_values(attribute)
    relation.map { |s| s.send(attribute) }.uniq
  end
end